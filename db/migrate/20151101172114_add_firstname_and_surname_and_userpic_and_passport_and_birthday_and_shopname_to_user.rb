class AddFirstnameAndSurnameAndUserpicAndPassportAndBirthdayAndShopnameToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :surname, :string
    add_column :users, :userpic, :string
    add_column :users, :passport, :string
    add_column :users, :birthday, :date
    add_column :users, :shopname, :string
  end
end
