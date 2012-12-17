# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

Admin.create!(email: "admin@example.org",
             password: "foobar",
             password_confirmation: "foobar")

User.create!(email: "example@example.org",
             name: "Serra Kia",
             password: "foobar",
             password_confirmation: "foobar")

10.times do |n|
  name  = Faker::Company.name
  email = "example-#{n+1}@example.org"
  password  = "password"
  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password)
end

User.all.each do |user|
  5.times do
    user.events.create name: Faker::Name.name, address: Faker::Address.street_address(include_secondary = false), dob: 10.years.ago, ssn: Faker::Base.numerify("####")
  end
end
