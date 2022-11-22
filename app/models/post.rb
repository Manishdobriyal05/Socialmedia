class Post < ApplicationRecord
  validates :body, length: {minimum: 1, maximum: 200}

  belongs_to :user
  has_many_attached :images
end


