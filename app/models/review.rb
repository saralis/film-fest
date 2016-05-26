class Review < ActiveRecord::Base
  belongs_to :film
  belongs_to :user
  has_many :comments

  validates :title, :body, presence: true
end
