# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Heartlike::User.destroy_all
Heartlike::User.create!(email: 'example@example.com', password: 'foobar')
Heartlike::Category.destroy_all
Heartlike::Category.create!(title: 'test category', description: 'test category first')
Heartlike::Article.destroy_all
15.times { Heartlike::Article.create!(title: Faker::Lorem.sentence(3, false, 4), body: Faker::Lorem.paragraph(10), user_id: Heartlike::User.last.id, category: Heartlike::Category.first) }