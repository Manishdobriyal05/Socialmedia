class Post < ApplicationRecord
  validates :body, length: {minimum: 1, maximum: 200}

  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  
end


