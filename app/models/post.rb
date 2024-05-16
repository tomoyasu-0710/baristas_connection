class Post < ApplicationRecord
  # userテーブルと関連付け
  belongs_to :user
  # commentテーブルと関連付け（ポリモーフィック）
  has_many :comments, as: :commentable, dependent: :destroy
  # likeテーブルと関連付け（ポリモーフィック
  has_many :liks, as: :likeable, dependent: :destroy
  
  has_one_attached :image
  
  
  def get_image
    if image.attached?
      image.variant(resize_to_limit: [100,100]).processed
    else
      nil
    end
  end
  
end


