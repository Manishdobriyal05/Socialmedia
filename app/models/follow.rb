class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: :follow_by, class_name: 'User'
  belongs_to :followee, foreign_key: :follow_to, class_name: 'User'

  # belongs_to :follower, class_name: 'User'
  # belongs_to :followee, class_name: 'User'

  validates :follow_by, presence: true
  validates :follow_to, presence: true

  # validates :follower, presence: true
  # validates :followee, presence: true

end





