class Tag < ApplicationRecord
  
  has_many :post_tags, depenndent: :destroy
end
