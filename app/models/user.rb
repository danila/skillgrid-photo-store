class User < ActiveRecord::Base
  authenticates_with_sorcery!

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, format: VALID_EMAIL_REGEX
  validates :email, uniqueness: true
  validates :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true


  has_many :products
end
