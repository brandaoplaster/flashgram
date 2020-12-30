class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :likes
  has_many :comments
  has_many :posts, foreign_key: :created_by_id, dependent: :destroy

  validates :name, :username, presence: true
  validates :username, uniqueness: true
end
