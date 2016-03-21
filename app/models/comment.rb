class Comment < ActiveRecord::Base

  # Validate that the post exists
  validates :post, presence: true

  # Validate
  validates :comment, length: {
      minimum: 3,
      maximum: 1000 ,
      too_long: '%{count} characters is the maximum allowed',
      too_short: '%{count} characters is the minimum allowed'
  }

  belongs_to :post
  belongs_to :user
end
