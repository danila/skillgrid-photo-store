# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
guest = User.create(email: 'guest@gmail.com',
                    password: '123456',
                    password_confirmation: '123456',
                    role: 'guest')

guest1 = User.create(email: 'guest@gmail.ru',
                    password: '123456',
                    password_confirmation: '123456',
                    role: 'guest')

shopkeeper = User.create(email: 'shopkeeper@gmail.com',
                         password: '12345678',
                         password_confirmation: '12345678',
                         role: 'shopkeeper',
                         shopname: 'SUPERTELESHOP')

admin = User.create(email: 'admin@gmail.com',
                    password: '1234567890',
                    password_confirmation: '1234567890',
                    role: 'admin',
                    firstname: 'Admin',
                    surname: 'Admin')


Product.delete_all

Product.create(name: 'Train platform',
                description: 'Kraskovo platform, Kazan direction',
                price: 15,
                user_id: shopkeeper.id,
                shopname: shopkeeper.shopname,
                pro: true).tap do |p|

  p.image = Rails.root.join("app/assets/images/0.jpg").open
  p.save!
end


Product.create(name: 'White bridge',
                description: 'Kraskovo village, Moscow region',
                user_id: shopkeeper.id,
                price:10).tap do |p|

  p.image = Rails.root.join("app/assets/images/1.jpg").open
  p.save!
end

Product.create(name: 'Street',
                description: 'Kraskovo village, Moscow region',
                price: 15,
                user_id: shopkeeper.id,
                shopname: shopkeeper.shopname).tap do |p|

  p.image = Rails.root.join("app/assets/images/2.jpg").open
  p.save!
end

Product.create(name: 'Diod girl',
                description: 'Muzeon park, Moscow',
                price: 10,
                user_id: shopkeeper.id,
                shopname: shopkeeper.shopname).tap do |p|

  p.image = Rails.root.join("app/assets/images/3.jpg").open
  p.save!
end


Product.create(name: 'Rest',
                description: 'Plaça de l\'Ictineo, Barcelona',
                price: 15,
                user_id: shopkeeper.id,
                pro: true).tap do |p|

  p.image = Rails.root.join("app/assets/images/4.jpg").open
  p.save!
end


Product.create(name: 'Take a look',
                description: 'Zhukovskiy, Moscow region',
                price: 5,
                user_id: shopkeeper.id).tap do |p|

  p.image = Rails.root.join("app/assets/images/5.jpg").open
  p.save!
end


Product.create(name: 'Traffic',
                description: 'Zhukovskiy, Moscow region',
                price: 10,
                user_id: shopkeeper.id,
                shopname: shopkeeper.shopname,
                pro: true).tap do |p|

  p.image = Rails.root.join("app/assets/images/6.jpg").open
  p.save!
end

Product.create(name: 'Icicles',
                description: 'Apothecary Garden, Moscow',
                price: 10,
                user_id: shopkeeper.id).tap do |p|

  p.image = Rails.root.join("app/assets/images/7.jpg").open
  p.save!
end


Product.create(name: 'The Last of the Mohicans',
                description: 'Apothecary Garden, Moscow',
                price: 5,
                user_id: shopkeeper.id).tap do |p|

  p.image = Rails.root.join("app/assets/images/8.jpg").open
  p.save!
end

