class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_image
  
  # group、group_userテーブルとの関連付け
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  
  # commentsテーブルとの関連付け
  has_many :comments, dependent: :destroy
  
  # likesテーブルとの関連付け
  has_many :likes, dependent: :destroy
  
  # cupping_noteテーブルとの関連付け
  has_many :cupping_notes, dependent: :destroy
  
  # postsテーブルとの関連付け
  has_many :posts, dependent: :destroy
  
  # ゲストログイン用のメソッド
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end
  
  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  
end
