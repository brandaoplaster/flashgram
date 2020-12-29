class Post < ApplicationRecord

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def liked_by?(user)
    likes.where(user: user).exists?
  end
end
