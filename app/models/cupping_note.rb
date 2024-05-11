class CuppingNote < ApplicationRecord
  # userテーブルと関連付け
  belongs_to :user
  # commentテーブルと関連付け（ポリモーフィック）
  has_many :comments, as: :commentable
  # likeテーブルと関連付け（ポリモーフィック)
  has_many :likes, as: :likeable
  # flavor_tagと関連付け
  has_many :flavor_tags, depenndent: :destroy
  has_many :flavors, through: :flavor_tags
end
