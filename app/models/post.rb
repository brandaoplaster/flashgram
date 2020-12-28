class Post < ApplicationRecord

  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user: user).exists?
  end
end
