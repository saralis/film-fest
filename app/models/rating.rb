class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :film

  validates :value, presence: true
end
