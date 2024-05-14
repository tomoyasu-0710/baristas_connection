class Like < ApplicationRecord
    # 他モデルから利用可（ポリモーフィック）
  belongs_to :likeable, polymorphic: true
  belongs_to :user
  
end
