class Like < ApplicationRecord
    # 他モデルから利用可（ポリモーフィック）
  belongs_to :likeable, polymorphic: true
  belongs_to :user
  
  validates :user_id, uniqueness: {scope: [:post_id, :cupping_note_id, :comment_id]}
  
end
