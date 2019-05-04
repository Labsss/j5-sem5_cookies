require 'faker'

puts '***** Je nettoie les DB'
City.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
User.destroy_all
Gossip.destroy_all
TagGossip.destroy_all
Comment.destroy_all

# seed pour les city
puts '-> Je charge un jeu d\'essai city'
10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Base.regexify(/[0-8][0-9][0-9]{3}/)
  )
end
puts 'Jeu d\'essai City avec 10 items'

# seed pour les tag
puts '-> Je charge un jeu d\'essai Tag'
10.times do
  Tag.create!(
    title: Faker::Lorem.word
  )
end
puts 'Jeu d\'essai Tag avec 10 items'

# seed message privés
puts '-> Je charge un jeu d\'essai Private Message'
20.times do
  PrivateMessage.create!(
    content: Faker::Lorem.paragraph(2)
  )
end
puts 'Jeu d\'essai PrivateMessage avec 20 items'

# seed user
puts '-> Je charge un jeu d\'essai User'
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: Faker::Number.between(7, 77),
    password_digest: 'password',
    city_id: City.all.sample.id
  )
end
puts 'Jeu d\'essai User avec 10 items'

# seed gossip
puts '-> Je charge un jeu d\'essai Gossip'
20.times do
  Gossip.create!(
    title: Faker::Lorem.sentence(3),
    content: Faker::Lorem.paragraph(3),
    user_id: User.all.sample.id
  )
end
puts 'Jeu d\'essai Gossip avec 10 items'

# seed tag_gossip
puts '-> Je charge un jeu d\'essai Tag_Gossip'
30.times do
  TagGossip.create!(
    tag_id: Tag.all.sample.id,
    gossip_id: Gossip.all.sample.id
  )
end
puts 'Jeu d\'essai Tag_Gossip avec 10 items'

# seed pour les city
#puts '-> Je charge un jeu d\'essai comment'
#30.times do
#  Comment.create!(
#    name: Faker::Address.city,
#    zip_code: Faker::Base.regexify(/[0-8][0-9][0-9]{3}/)
#  )
#end
#puts 'Jeu d\'essai Comment avec 30 items'

puts '***** Base de données chargée avec un seed ! Have a nive run.'

