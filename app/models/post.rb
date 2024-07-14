class Post < ApplicationRecord
  # userテーブルと関連付け
  belongs_to :user
  # タグの関連付け
  has_many :post_tags,dependent: :destroy
  has_many :tags,through: :post_tags
  # commentテーブルと関連付け（ポリモーフィック）
  has_many :comments, as: :commentable, dependent: :destroy
  # likeテーブルと関連付け（ポリモーフィック
  has_many :likes, :as => :likeable, dependent: :destroy
  
  has_one_attached :image
  
  def get_image
    if image.attached?
      image.variant(resize_to_limit: [300,300]).processed
    else
      nil
    end
  end
  
  def liked_by?(user)
    self.likes.exists?(user_id: user.id)
  end
  
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tagname) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Post.where('title LIKE ?', '%' + content)
    else
      Post.where('title LIKE ?', '%' + content + '%')
    end
  end
  
  def name
    self.tag_name
  end
  
end


