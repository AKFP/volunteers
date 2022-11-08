# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create!(name: 'web client', redirect_uri: '', scopes: "")
  Doorkeeper::Application.create!(name: 'iOS client', redirect_uri: '', scopes: "")
  Doorkeeper::Application.create!(name: 'Android client', redirect_uri: '', scopes: "")
  Doorkeeper::Application.create!(name: 'React client', redirect_uri: '', scopes: "")
end

User.first_or_create(
          email: 'admin2@alkhidmat.org',
          password: '321321321',
          password_confirmation: '321321321'
          )