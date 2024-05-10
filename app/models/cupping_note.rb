class CuppingNote < ApplicationRecord
  # commentテーブルと関連付け（ポリモーフィック）
  has_many :comments, as: :commentable
  # likeテーブルと関連付け（ポリモーフィック
  has_many :liks, as: :likeable
end
