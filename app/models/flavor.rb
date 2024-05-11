class Flavor < ApplicationRecord
  # flavor_tagと関連付け
  has_many :flavor_tags, dependent: :destroy
  has_many :cupping_notes, through: :flavor_tags
end
