class Product < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	validates :name, :description, :price, presence: true
	validates :price, numericality: true
end
