class FlavorTag < ApplicationRecord
  # cupping_noteと関連付け
  belongs_to :cupping_note
  # と関連付け
  belongs_to :flavors
end
