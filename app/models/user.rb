class User < ActiveRecord::Base
  authenticates_with_sorcery!
  mount_uploader :userpic, UserpicUploader
  mount_uploader :passport, PassportUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :password, confirmation: true
  validates :email, :password, :password_confirmation, presence: true
  validates :email, format: VALID_EMAIL_REGEX
  validates :email, uniqueness: true


  has_many :products
end
