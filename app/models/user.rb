class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password,         presence: true, on: :create, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname,         presence: true, length: { maximum: 20 }
  validates :profile,          presence: true, length: { maximum: 200 }

  has_many :posts
  has_many :comments
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  # /ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  # //

  # /ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  # //

  # /フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
  # //
end
