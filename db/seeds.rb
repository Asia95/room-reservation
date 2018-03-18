# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Room.create!( name: '1', capacity: 30 )
Room.create!( name: '2', capacity: 30 )
Room.create!( name: '3', capacity: 30 )
Room.create!( name: '4', capacity: 30 )
Room.create!( name: '5', capacity: 30 )
Room.create!( name: '6', capacity: 30 )
Room.create!( name: '7', capacity: 30 )
Room.create!( name: '8', capacity: 30 )
Room.create!( name: '9', capacity: 30 )
Room.create!( name: '10', capacity: 30 )
Room.create!( name: '11', capacity: 30 )

admin = User.new({ :email => 'admin@example.com', 
          :password => 'password', 
          :password_confirmation => 'password',
          :admin => true})
admin.skip_confirmation!
admin.save
