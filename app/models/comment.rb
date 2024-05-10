class Comment < ApplicationRecord
  # userテーブルと関連付け
  belongs_to :user
  # 他モデルから利用可（ポリモーフィック）
  belongs_to :commentable, polymorphic: true
  # likeテーブルと関連付け（ポリモーフィック）
  has_many :liks, as: :likeable
end
