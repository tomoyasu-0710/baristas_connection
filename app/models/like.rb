class Like < ApplicationRecord
    # 他モデルから利用可（ポリモーフィック）
  belongs_to :likeable, polymorphic: true
  belongs_to :user
  
  validates :user_id, uniqueness: {scope: [:likeable_id, :likeable_type]}
  
end
