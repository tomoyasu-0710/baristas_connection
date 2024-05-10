class Like < ApplicationRecord
    # 他モデルから利用可（ポリモーフィック）
  belongs_to :likeable, polymorphic: true
#   commentテーブルと関連付け（ポリモーフィック）
  belongs_to :comments, as: :commentable
#   postテーブルと関連付け
  belongs_to :posts
#   cupping_noteテーブルと関連付け
  belongs_to :cupping_notes
#   userテーブルと関連付け
  belongs_to :users
  
end
