# require 'faker'

# AdminUser.destroy_all
# User.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'user@sample.com', password: 'password', password_confirmation: 'password', name: 'user', phone: '030000000000', role: 'user')
User.create!(email: 'labor@sample.com', password: 'password', password_confirmation: 'password', name: 'labor', phone: '030000000000', role: 'labor')
#
#
# 50.times do
#   User.create!(
#     email: Faker::Internet.email,
#     password: 'password',
#     password_confirmation: 'password',
#     name: Faker::Name.name,
#     phone: '030000000000',
#     role: 'labor'
#   )
# end
#
# 10.times do
#   User.create!(
#     email: Faker::Internet.email,
#     password: 'password',
#     password_confirmation: 'password',
#     name: Faker::Name.name,
#     phone: '030000000000',
#     role: 'user'
#   )
# end
