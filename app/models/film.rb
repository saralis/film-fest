class Film < ActiveRecord::Base
  belongs_to :category
  has_many :ratings
  has_many :reviews

  validates :name, :description, presence: true
  ratyrate_rateable "rating"
  def self.search(search)
    where("name ILIKE ?", "%#{search}")
    where("description ILIKE ?", "%#{search}")
  end

end
