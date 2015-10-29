class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :products

	validates :password, confirmation: true
	validates :email, :password, presence: true
	validates :email, uniqueness: true
end
