class User < ActiveRecord::Base
  has_many :reviews
  has_many :comments
  has_secure_password
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, uniqueness: true
end
