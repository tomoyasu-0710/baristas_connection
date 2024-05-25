class Post < ApplicationRecord
  # userテーブルと関連付け
  belongs_to :user
  # タグの関連付け
  has_many :post_tags,dependent: :destroy
  has_many :tags,through: :post_tags
  # commentテーブルと関連付け（ポリモーフィック）
  has_many :comments, as: :commentable, dependent: :destroy
  # likeテーブルと関連付け（ポリモーフィック
  has_many :likes, :as => :likeable, dependent: :destroy
  
  has_one_attached :image
  
  def get_image
    if image.attached?
      image.variant(resize_to_limit: [300,300]).processed
    else
      nil
    end
  end
  
  def liked_by?(user)
    self.likes.exists?(user_id: user.id)
  end
  
end


