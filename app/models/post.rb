class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc)}
  validates :title, :body, presence: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
