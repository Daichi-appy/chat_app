class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  has_many :posts, dependent: :destroy

  #自分がフォローしているユーザーとの関連
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  #自分がフォローされるユーザーとの関連
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user_rooms
  has_many :likes
  has_many :comments

  def followed_by?(user)
    #自分が相手をフォローしているかどうか
    passive_relationships.find_by(following_id: user.id).present?
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

end
