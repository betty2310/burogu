# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!([
               {full_name: "Huynh Duong", email: "betty2310@duck.com", password: "123456", password_confirmation: "123456"},
               {full_name: "Phuong Anh", email: "pahmt@gmail.com", password: "123456", password_confirmation: "123456"},
             ])

users= User.all
20.times do
  users.each do |user|
    user.posts.create!({title: Faker::Lorem.sentence(word_count: 3),
                        content: Faker::Lorem.sentence(word_count: 200, supplemental: false)})
  end
end