class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :reviews
  has_many :comments
  has_many :ratings
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, uniqueness: true
  ratyrate_rater
end
