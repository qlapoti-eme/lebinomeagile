# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
User.destroy_all
SecondaryCategory.destroy_all
PrimaryCategory.destroy_all
Proposal.destroy_all
Booking.destroy_all



puts "Creating users..."
user1 = User.create!( email: "emarie1@gmail.com", password: '123456')
user2 = User.create!( email: "yoann@gmail.com", password: 'azerty')
user3 = User.create!( email: "fred@gmail.com", password: 'azerty')

puts "Creating Primary Categories..."
img1 = "soutien_scolaire.jpg"
img2 = "loisirs.jpg"
img3 = "conseils.jpg"
primary_category1 = PrimaryCategory.create!( name: "Soutien scolaire", image: img1)
primary_category2 = PrimaryCategory.create!( name: "Moment loisir", image: img2)
primary_category3 = PrimaryCategory.create!( name: "Conseils", image: img3)

puts "Creating Secondary Categories..."
img1 = "primaire.jpg"
img2 = "secondaire.jpg"
img3 = "lycée.jpg"
img4 = "culinaire.jpg"
img5 = "littéraire.jpg"
img6 = "musical.jpg"
img7 = "diy.jpg"
img8 = "bricolage.jpg"
img9 = "botanique.jpg"
img10 = "coaching.jpg"
secondary_category1 = SecondaryCategory.create!( name:"primaire" , primary_category: primary_category1, image: img1)
secondary_category2 = SecondaryCategory.create!( name:"secondaire" , primary_category: primary_category1, image: img2)
secondary_category3 = SecondaryCategory.create!( name:"lycée" , primary_category: primary_category1, image: img3)
secondary_category4 = SecondaryCategory.create!( name:"culinaire", primary_category: primary_category2, image: img4)
secondary_category5 = SecondaryCategory.create!( name:"littéraire" , primary_category: primary_category2, image: img5)
secondary_category6 = SecondaryCategory.create!( name:"musical" , primary_category: primary_category2, image: img6)
secondary_category7 = SecondaryCategory.create!( name:"linguistique" , primary_category: primary_category2, image: img7)
secondary_category8 = SecondaryCategory.create!( name:"bricolage" , primary_category: primary_category3, image: img8)
secondary_category9 = SecondaryCategory.create!( name:"botanique" , primary_category: primary_category3, image: img9)
secondary_category10 = SecondaryCategory.create!( name:"coaching personnel" , primary_category: primary_category3, image: img10)

puts "Creating proposals..."
proposal1 = Proposal.create!( name: "Aide aux devoirs", description: "Je peux aider des collégiens à faire leurs devoirs", proposer: user1, secondary_category: secondary_category2 , start_time: "2020-05-30 13:00", end_time: "2020-05-30 14:00" )
proposal2 = Proposal.create!( name: "Faire de la musique ensemble", description: "Dispo pour jouer un peu de guitare avec quelqu'un", proposer: user2, secondary_category: secondary_category6, start_time: "2020-06-01 13:00", end_time: "2020-06-01 14:00" )
proposal3 = Proposal.create!( name: "Partager mes meileures recettes", description: "Je cuisine tous les soirs vers 19h si quelqu'un veut cuisiner avec moi via zoom!", proposer: user3, secondary_category: secondary_category4, start_time: "2020-06-01 13:00", end_time: "2020-06-01 14:00" )
proposal4 = Proposal.create!( name: "Aider des enfants", description: "Institutrice à la retraite peut aider à faire les devoirs", proposer: user2, secondary_category: secondary_category1, start_time: "2020-06-01 13:00", end_time: "2020-06-01 13:00" )
proposal5 = Proposal.create!( name: "Conseils jardinage", description: "Passionnée de jardinage, je peux donner des petits conseils botaniques", proposer: user3, secondary_category: secondary_category9, start_time: "2020-06-01 13:00", end_time: "2020-06-01 13:00" )
proposal6 = Proposal.create!( name: "Aide à la lecture", description: "Je peux lire des histoires à des enfants à l'école pour que les parents puissent respirer un peu", proposer: user1, secondary_category: secondary_category1 , start_time: "2020-06-01 13:00", end_time: "2020-06-01 13:00" )
proposal7 = Proposal.create!( name: "Tutos guitare", description: "Si vous souhaitez déchiffrer des tutos avec moi :)", proposer: user2, secondary_category: secondary_category6, start_time: "2020-06-01 13:00", end_time: "2020-06-01 13:00" )
proposal8 = Proposal.create!( name: "Cuisiner ensemble", description: "Si vous en avez marre d'être sseul(e) en cuisine, on peut zoom-cuisiner ensemble ;)!", proposer: user3, secondary_category: secondary_category4, start_time: "2020-06-01 13:00", end_time: "2020-06-01 13:00" )
proposal9 = Proposal.create!( name: "Cours de math", description: "Prof à la retraite peut aider à faire des exos de math", proposer: user2, secondary_category: secondary_category2, start_time: "2020-06-01 13:00", end_time: "2020-06-01 13:00" )
proposal10 = Proposal.create!( name: "Do It Yourself", description: "Passionnée de DIY, je peux donner des petits conseils", proposer: user3, secondary_category: secondary_category7, start_time: "2020-06-01 13:00", end_time: "2020-06-01 13:00" )
proposal11 = Proposal.create!( name: "Atelier récupération palettes", description: "Hello, passioné de craft et récup, je vous propose un petit atelier pour faire des meubles sympa", proposer: user3, secondary_category: secondary_category8, start_time: "2020-06-01 13:00", end_time: "2020-06-01 13:00" )
proposal12 = Proposal.create!( name: "Tiramisu à l'italienne", description: "Je viens de l'italie, j'aime la couisine della nonna", proposer: user1, secondary_category: secondary_category4, start_time: "2020-06-01 13:00", end_time: "2020-06-01 13:00" )
proposal13 = Proposal.create!( name: "Discussions Espagnol / Français", description: "Hola ! Je suis Espagnol je parle un peu de français. Je vous propose de discuter ensemble 30 minutes en français puis 30 minutes en espagnol", proposer: user1, secondary_category: secondary_category7, start_time: "2020-06-01 13:00", end_time: "2020-06-01 13:00" )


puts "Creating bookings..."
booking1 = Booking.create!( reservation_status: "pending", url_room: "google.com", chatroom: 12, booker: user1, proposal: proposal5 )
booking2 = Booking.create!( reservation_status: "booked", url_room: "google.com", chatroom: 3, booker: user2, proposal: proposal3 )
booking3 = Booking.create!( reservation_status: "pending", url_room: "google.com", chatroom: 5, booker: user3, proposal: proposal2 )

puts "Finished!"
