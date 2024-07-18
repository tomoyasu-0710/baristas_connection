class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:name]

  has_one_attached :profile_image

  # group、group_userテーブルとの関連付け
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  # commentsテーブルとの関連付け
  has_many :comments, dependent: :destroy

  # likesテーブルとの関連付け
  has_many :likes, dependent: :destroy

  has_many :like_posts, through: :likes, source: :likeable, source_type: "Post"

  # cupping_noteテーブルとの関連付け
  has_many :cupping_notes, dependent: :destroy

  # postsテーブルとの関連付け
  has_many :posts, dependent: :destroy

  def self.find_for_database_authentication(warden_conditions)
    find_by(name: warden_conditions[:name])
  end

  # ゲストログイン用のメソッド
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end
  
  
def guest?
  self.email == 'guest@example.com'
end

  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      where(name: content)
    elsif method == 'forward'
      where('name LIKE ?', content + '%')
    elsif method == 'backward'
      where('name LIKE ?', '%' + content)
    else
      where('name LIKE ?', '%' + content + '%')
    end
  end


end
