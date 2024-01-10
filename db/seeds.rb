# db/seeds.rb

# Create Users
user1 = User.create(email: 'user1@example.com', password: 'password1')
user2 = User.create(email: 'user2@example.com', password: 'password2')

# Create Items
item1 = Item.create(name: 'Item 1', availability: true, photo: 'item1.jpg', cost: 25.99, description: 'Description for Item 1' )
item2 = Item.create(name: 'Item 2', availability: false, photo: 'item2.jpg', cost: 35.99, description: 'Description for Item 1')

# Create Reservations
reservation1 = Reservation.create(user: user1, item: item1, start: Time.now, finish: Time.now + 2.days, city: 'City1', description: 'Description for reservation 1')
reservation2 = Reservation.create(user: user2, item: item2, start: Time.now + 1.day, finish: Time.now + 3.days, city: 'City2', description: 'Description for reservation 2')

puts 'Seed data has been created successfully!'
