class User < ActiveRecord::Base
  authenticates_with_sorcery!

	validates :password, confirmation: true
	validates :username, :email, :password, presence: true
	validates :username, :email, uniqueness: true
end
