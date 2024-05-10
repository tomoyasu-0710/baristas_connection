class Group < ApplicationRecord
  has_many :comments, as: :commentable
end
