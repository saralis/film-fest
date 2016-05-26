class Film < ActiveRecord::Base
  belongs_to :category
  has_many :ratings
  has_many :reviews

  validates :name, :description, presence: true

  def self.search(search)
    where("name ILIKE ?", "%#{search}")
    where("description ILIKE ?", "%#{search}")
  end

  def avg
    if self.ratings.length >= 1
     ((self.ratings.map{|rating| rating.value}.reduce(:+).to_f) / (self.ratings.length).to_f).round(2)
    end
  end


end
