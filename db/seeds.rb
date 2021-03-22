# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
manager = Role.create! name: 'Manager', code: 'M'
customer = Role.create! name: 'Customer', code: 'C'

User.create! name: 'Test Customer', email: 'customer@test.com', password: 'customer123', password_confirmation: 'customer123', gender: 'Male', date_of_birth: Time.now - 10.years, role_id: customer.id
User.create! name: 'Test Manager', email: 'manager@test.com', password: 'manager123', password_confirmation: 'manager123', gender: 'Male', date_of_birth: Time.now - 20.years, role_id: manager.id