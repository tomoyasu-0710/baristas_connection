class CuppingNote < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :liks, as: :likeable
end
