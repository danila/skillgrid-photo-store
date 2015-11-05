class AddProToProduct < ActiveRecord::Migration
  def change
    add_column :products, :pro, :boolean, null: false, default: false
  end
end
