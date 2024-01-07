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

100.times do
  User.create!({full_name: Faker::Name.name,
                email: Faker::Internet.email,
                password: "123456",
                password_confirmation: "123456"})
end

users= User.all
users_write_post = users[1..10]
10.times do
  users_write_post.each do |user|
    user.posts.create!({title: Faker::Lorem.sentence(word_count: 7),
                        content: Faker::Lorem.sentence(word_count: 200, supplemental: false)})
  end
end

user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }