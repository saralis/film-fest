class Film < ActiveRecord::Base
  belongs_to :category
  has_many :ratings
  has_many :reviews

  validates :name, :description, presence: true

  def self.search(search)
    where("name ILIKE ?", "%#{search}")
    where("description ILIKE ?", "%#{search}")
  end

  def user_avg
    if self.ratings.length >= 1
      users_ratings = self.ratings.select{ |rating| !rating.user.judge }
     ((users_ratings.map{ |rating| rating.value }.reduce(:+).to_f ) / ( users_ratings.length ).to_f).round(2)
    end
  end

  def judge_avg
    if self.ratings.length >= 1
      judge_ratings = self.ratings.select{ |rating| rating.user.judge }
     ((judge_ratings.map{ |rating| rating.value }.reduce(:+).to_f ) / ( judge_ratings.length ).to_f).round(2)
    end
  end

end
