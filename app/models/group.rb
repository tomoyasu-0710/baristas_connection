class Group < ApplicationRecord
  # commentテーブルとの関連付け（ポリモーフィック）
  has_many :comments, as: :commentable, dependent: :destroy
  
  
  # group_userテーブルとの関連付け
  belongs_to :owner, class_name: 'User'
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user
  validates :title, presence: true
  validates :body, presence: true
  has_one_attached :image

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  
end
