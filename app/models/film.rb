class Film < ActiveRecord::Base
  belongs_to :category
  has_many :ratings
  has_many :reviews

  validates :name, :description, presence: true
end
