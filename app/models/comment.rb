class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  scope :rating_desc, -> { order(rating: :desc) }
 
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true ,greater_than: 0,less_than: 6}

  after_create_commit {CommentUpdateJob.perform_later(self, @user)}

end
