class Comment < ApplicationRecord
  validates :comment, presence: true
  
  # userテーブルと関連付け
  belongs_to :user
  # 他モデルから利用可（ポリモーフィック）
  belongs_to :commentable, polymorphic: true
  # likeテーブルと関連付け（ポリモーフィック）
  has_many :likes, as: :likeable
  
  
end
