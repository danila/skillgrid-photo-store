class AddShopnameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :shopname, :string
  end
end
