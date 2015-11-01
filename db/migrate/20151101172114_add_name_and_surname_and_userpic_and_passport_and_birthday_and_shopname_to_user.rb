class AddNameAndSurnameAndUserpicAndPassportAndBirthdayAndShopnameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :userpic, :string
    add_column :users, :passport, :string
    add_column :users, :birthday, :datetime
    add_column :users, :shopname, :string
  end
end
