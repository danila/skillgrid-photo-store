class Product < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	validates_pesence_of :name, :price
	validates_numericality_of :price

end
