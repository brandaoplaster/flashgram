class Post < ApplicationRecord

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :created_by, class_name: "User"

  def liked_by?(user)
    likes.where(user: user).exists?
  end
end
