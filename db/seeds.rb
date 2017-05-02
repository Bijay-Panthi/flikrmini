# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all

user1 = User.create(name: "Bill", email:"Bill@ga.co", password:"chicken", password_confirmation: "chicken" )

user2 = User.create(name: "admin", email:"admin@ga.co", password:"password", password_confirmation: "password" )

user3 = User.create(name: "Bj", email:"Bj@ga.co", password:"goat", password_confirmation: "goat" )

p user1.password_digest

p user2.password_digest


Post.destroy_all

post1 = Post.create(description: "My First Photo", image: "http://www.gettyimages.ca/gi-resources/images/Embed/new/embed2.jpg", user_id: user1.id)
post2 = Post.create(description: "My Second Photo", image: "http://www.fillmurray.com/g/200/300", user_id: user2.id)
post3 = Post.create(description: "My Third Photo", image: "http://www.fillmurray.com/g/300/300", user_id: user3.id)

p post1.user_id

Comment.destroy_all

first_comment = Comment.create(comment: "What a great photo", post_id: post1.id)
second_comment = Comment.create(comment: "Cool", post_id: post2.id)
third_comment = Comment.create(comment: "Awesome", post_id: post3.id)

p first_comment.post_id
