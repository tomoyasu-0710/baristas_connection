class CuppingNote < ApplicationRecord
  # userテーブルと関連付け
  belongs_to :user
  # commentテーブルと関連付け（ポリモーフィック）
  has_many :comments, as: :commentable, dependent: :destroy
  # likeテーブルと関連付け（ポリモーフィック)
  has_many :likes, as: :likeable
  # flavor_tagと関連付け
  has_many :flavor_tags, depenndent: :destroy
  has_many :flavors, through: :flavor_tags

  has_one_attached :image

  def get_image
    if image.attached?
      image.variant(resize_to_limit: [300,300]).processed
    else
      nil
    end
  end

  def self.search_for(content, method)
    if method == 'perfect'
      where(sumple_name: content)
    elsif method == 'forward'
      where('sumple_name LIKE ?', content + '%')
    elsif method == 'backward'
      where('sumple_name LIKE ?', '%' + content)
    else
      where('sumple_name LIKE ?', '%' + content + '%')
    end
  end

end
