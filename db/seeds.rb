# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
manager_role = Role.find_by name: 'Manager', code: 'M'
manager_role = Role.create! name: 'Manager', code: 'M' if manager_role.blank?
customer_role = Role.find_by name: 'Customer', code: 'C'
customer_role = Role.create! name: 'Customer', code: 'C' if customer_role.blank?

customer = User.find_by email: 'customer@test.com'
customer.update role_id: customer_role.id
User.create! name: 'Test Customer', email: 'customer@test.com', password: 'customer123', password_confirmation: 'customer123', gender: 'Male', date_of_birth: Time.now - 10.years, role_id: customer_role.id if customer.blank?


manager = User.find_by email: 'manager@test.com'
manager.update role_id: manager_role.id
User.create! name: 'Test Manager', email: 'manager@test.com', password: 'manager123', password_confirmation: 'manager123', gender: 'Male', date_of_birth: Time.now - 20.years, role_id: manager_role.id if manager.blank?