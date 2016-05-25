class Review < ActiveRecord::Base
  belongs_to :film
  belongs_to :user

  validates :title, :body, presence: true
end
