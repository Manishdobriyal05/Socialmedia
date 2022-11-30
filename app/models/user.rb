class User < ApplicationRecord
  
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  #validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

  has_many :posts, dependent: :destroy


  has_many :followed_users, foreign_key: :follow_by, class_name: 'Follow'
  has_many :followees, through: :followed_users
  
  has_many :following_users, foreign_key: :follow_to, class_name: 'Follow'
  has_many :followers, through: :following_users



  def follow(user_id)
    followed_users.create(follow_to: user_id)
  end

  def unfollow(user_id)
    followed_users.find_by(follow_to: user_id).destroy
  end

  def following?(user_id)
    following_users.pluck(:id).include?(user_id)
  end


end





