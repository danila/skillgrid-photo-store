class Product < ActiveRecord::Base
	mount_uploader :image, ImageUploader
  belongs_to :user

	validates :name, :description, :price, presence: true
	validates :price, numericality: true

  def shop_name
    user = User.find(user_id)
    user.shopname
  end
end
