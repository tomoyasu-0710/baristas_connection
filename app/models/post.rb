class Post < ApplicationRecord
  # userテーブルと関連付け
  belongs_to :user
  # commentテーブルと関連付け（ポリモーフィック）
  has_many :comments, as: :commentable, dependent: :destroy
  # likeテーブルと関連付け（ポリモーフィック
  has_many :liks, as: :likeable, dependent: :destroy
end
