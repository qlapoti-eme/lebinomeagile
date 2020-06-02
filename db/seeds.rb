# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
puts "secondary_category destroy"
Booking.destroy_all
puts "primary_category destroy"
puts "user destroy"
User.destroy_all
puts "slot destroy"
Slot.destroy_all
puts "booking destroy"
Proposal.destroy_all
puts "proposal destroy"
SecondaryCategory.destroy_all
PrimaryCategory.destroy_all

# SOUTIEN SCOLAIRE . primaire . secondaire . lycée
# MOMENT LOISIR . culinaire . littéraire . musical . linguistique
# CONSEILS . bricolage . botanique . coaching personnel

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
img3 = "lycee.jpg"
img4 = "culinaire.jpg"
img5 = "littéraire.jpg"
img6 = "musical.jpg"
img7 = "diy.jpg"
img8 = "bricolage.jpg"
img9 = "botanique.jpg"
img10 = "coaching.jpg"

# SOUTIEN SCOLAIRE . primaire . secondaire . lycée
secondary_category1 = SecondaryCategory.create!( name:"primaire" , primary_category: primary_category1, image: img1)
secondary_category2 = SecondaryCategory.create!( name:"secondaire" , primary_category: primary_category1, image: img2)
secondary_category3 = SecondaryCategory.create!( name:"lycée" , primary_category: primary_category1, image: img3)

# MOMENT LOISIR . culinaire . littéraire . musical . linguistique
secondary_category4 = SecondaryCategory.create!( name:"culinaire", primary_category: primary_category2, image: img4)
secondary_category5 = SecondaryCategory.create!( name:"littéraire" , primary_category: primary_category2, image: img5)
secondary_category6 = SecondaryCategory.create!( name:"musical" , primary_category: primary_category2, image: img6)
secondary_category7 = SecondaryCategory.create!( name:"linguistique" , primary_category: primary_category2, image: img7)

# CONSEILS . bricolage . botanique . coaching personnel
secondary_category8 = SecondaryCategory.create!( name:"bricolage" , primary_category: primary_category3, image: img8)
secondary_category9 = SecondaryCategory.create!( name:"botanique" , primary_category: primary_category3, image: img9)
secondary_category10 = SecondaryCategory.create!( name:"coaching personnel" , primary_category: primary_category3, image: img10)


# 1ere salve toutes catégories
puts "Creating proposals..."
proposal1 = Proposal.create!( name: "Aide aux devoirs", description: "Je peux aider des collégiens à faire leurs devoirs", proposer: user1, secondary_category: secondary_category2  )
proposal2 = Proposal.create!( name: "Faire de la musique ensemble", description: "Dispo pour jouer un peu de guitare avec quelqu'un", proposer: user2, secondary_category: secondary_category6 )
proposal3 = Proposal.create!( name: "Partager mes meileures recettes", description: "Je cuisine tous les soirs vers 19h si quelqu'un veut cuisiner avec moi via zoom!", proposer: user3, secondary_category: secondary_category4 )
proposal4 = Proposal.create!( name: "Aider des enfants", description: "Institutrice à la retraite peut aider à faire les devoirs", proposer: user2, secondary_category: secondary_category1 )
proposal5 = Proposal.create!( name: "Conseils jardinage", description: "Passionnée de jardinage, je peux donner des petits conseils botaniques", proposer: user3, secondary_category: secondary_category9 )
proposal6 = Proposal.create!( name: "Aide à la lecture", description: "Je peux lire des histoires à des enfants à l'école pour que les parents puissent respirer un peu", proposer: user1, secondary_category: secondary_category1 )
proposal7 = Proposal.create!( name: "Tutos guitare", description: "Si vous souhaitez déchiffrer des tutos avec moi :)", proposer: user2, secondary_category: secondary_category6 )
proposal8 = Proposal.create!( name: "Cuisiner ensemble", description: "Si vous en avez marre d'être sseul(e) en cuisine, on peut zoom-cuisiner ensemble ;)!", proposer: user3, secondary_category: secondary_category4)
proposal9 = Proposal.create!( name: "Cours de math", description: "Prof à la retraite peut aider à faire des exos de math", proposer: user2, secondary_category: secondary_category2 )
proposal10 = Proposal.create!( name: "Do It Yourself", description: "Passionnée de DIY, je peux donner des petits conseils", proposer: user3, secondary_category: secondary_category7 )
proposal11 = Proposal.create!( name: "Atelier récupération palettes", description: "Hello, passioné de craft et récup, je vous propose un petit atelier pour faire des meubles sympa", proposer: user3, secondary_category: secondary_category8 )
proposal12 = Proposal.create!( name: "Tiramisu à l'italienne", description: "Je viens de l'italie, j'aime la couisine della nonna", proposer: user1, secondary_category: secondary_category4 )
proposal13 = Proposal.create!( name: "Discussions Espagnol / Français", description: "Hola ! Je vous propose de discuter ensemble 30 minutes en français puis en espagnol", proposer: user1, secondary_category: secondary_category7 )

# slots
slot11 = Slot.create!( proposal: proposal1, start_time: DateTime.strptime("06/02/2020 8:00", "%m/%d/%Y %H:%M"))
slot12 = Slot.create!( proposal: proposal1, start_time: DateTime.strptime("06/02/2020 9:00", "%m/%d/%Y %H:%M"))
slot13 = Slot.create!( proposal: proposal1, start_time: DateTime.strptime("06/02/2020 10:00", "%m/%d/%Y %H:%M"))

slot22 = Slot.create!( proposal: proposal2, start_time: DateTime.strptime("06/03/2020 9:00", "%m/%d/%Y %H:%M"))
slot21 = Slot.create!( proposal: proposal2, start_time: DateTime.strptime("06/03/2020 8:00", "%m/%d/%Y %H:%M"))
proposal2_StarTime1 = "06/03/2020 10:00"
slot23 = Slot.create!( proposal: proposal2, start_time: DateTime.strptime(proposal2_StarTime1, "%m/%d/%Y %H:%M"))

proposal3_StarTime1 = "06/04/2020 9:00"
slot32 = Slot.create!( proposal: proposal3, start_time: DateTime.strptime(proposal3_StarTime1, "%m/%d/%Y %H:%M"))
slot31 = Slot.create!( proposal: proposal3, start_time: DateTime.strptime("06/04/2020 8:00", "%m/%d/%Y %H:%M"))
slot33 = Slot.create!( proposal: proposal3, start_time: DateTime.strptime("06/04/2020 10:00", "%m/%d/%Y %H:%M"))

Slot.create!( proposal: proposal4, start_time: DateTime.strptime("06/10/2020 13:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal4, start_time: DateTime.strptime("06/10/2020 14:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal4, start_time: DateTime.strptime("06/10/2020 15:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal4, start_time: DateTime.strptime("06/10/2020 16:00", "%m/%d/%Y %H:%M"))

proposal5_StarTime1 = "06/10/2020 10:00"
Slot.create!( proposal: proposal5, start_time: DateTime.strptime(proposal5_StarTime1, "%m/%d/%Y %H:%M"))

Slot.create!( proposal: proposal6, start_time: DateTime.strptime("06/10/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal7, start_time: DateTime.strptime("06/10/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal8, start_time: DateTime.strptime("06/10/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal9, start_time: DateTime.strptime("06/10/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal10, start_time: DateTime.strptime("06/10/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal11, start_time: DateTime.strptime("06/10/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal12, start_time: DateTime.strptime("06/10/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal13, start_time: DateTime.strptime("06/10/2020 10:00", "%m/%d/%Y %H:%M"))

# 2eme salve
# CONSEILS . bricolage . botanique . coaching personnel | secondary_category8 . secondary_category9 . secondary_category10
name_conseil_01 = "Démonter son micro-onde"
description_conseil_01 = "Que faut-il savoir avant de vous lancez dans la réparation de votre micro-onde?"
start_conseil_01 = "05/01/2020 13:00"

name_conseil_02 = "Vidanger sa voiture"
description_conseil_02 = "Comment être efficace: choix de l'huile, recyclage de l'huile usager."
start_conseil_02 = "06/08/2020 13:00"

name_conseil_03 = "Tailler ses rosiers"
description_conseil_03 = "Pour avoir de belles roses chaque année, suivez moi dans la préparation des rosiers!"
start_conseil_03 = "04/01/2020 13:00"

name_conseil_04 = "Tailler ses pommiers"
description_conseil_04 = "Les pommiers sont trés résistants! La taille est trés simple, quels sont les bons gestes?"
start_conseil_04 = "06/09/2020 13:00"

name_conseil_05 = "What color is your parachute?"
description_conseil_05 = "Ancier DRH, je vous propose de discuter de vos projets de reconversion!"
start_conseil_05= "05/20/2020 13:00"

name_conseil_06 = "Devenir néo-paysan"
description_conseil_06 = "J'ai fait mon retour à la nature en famille il y a 1 an, je vous propose de partager cette expérience!"
start_conseil_06 = "06/07/2020 13:00"

proposal_conseil_01 = Proposal.create!( name: name_conseil_01, description: description_conseil_01, proposer: user1, secondary_category: secondary_category8  )
proposal_conseil_06 = Proposal.create!( name: name_conseil_06, description: description_conseil_06, proposer: user3, secondary_category: secondary_category10 )
proposal_conseil_04 = Proposal.create!( name: name_conseil_04, description: description_conseil_04, proposer: user1, secondary_category: secondary_category9  )
proposal_conseil_02 = Proposal.create!( name: name_conseil_02, description: description_conseil_02, proposer: user2, secondary_category: secondary_category8  )
proposal_conseil_03 = Proposal.create!( name: name_conseil_03, description: description_conseil_03, proposer: user3, secondary_category: secondary_category9  )
proposal_conseil_05 = Proposal.create!( name: name_conseil_05, description: description_conseil_05, proposer: user2, secondary_category: secondary_category10 )

proposal_conseil_01_slot32 = Slot.create!( proposal: proposal_conseil_01, start_time: DateTime.strptime("05/04/2020 9:00", "%m/%d/%Y %H:%M"))
proposal_conseil_01_slot31 = Slot.create!( proposal: proposal_conseil_01, start_time: DateTime.strptime("05/04/2020 8:00", "%m/%d/%Y %H:%M"))
proposal_conseil_01_slot33 = Slot.create!( proposal: proposal_conseil_01, start_time: DateTime.strptime("05/04/2020 10:00", "%m/%d/%Y %H:%M"))

Slot.create!( proposal: proposal_conseil_01, start_time: DateTime.strptime(start_conseil_01, "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal_conseil_02, start_time: DateTime.strptime(start_conseil_02, "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal_conseil_03, start_time: DateTime.strptime(start_conseil_03, "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal_conseil_04, start_time: DateTime.strptime(start_conseil_04, "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal_conseil_05, start_time: DateTime.strptime(start_conseil_05, "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal_conseil_06, start_time: DateTime.strptime(start_conseil_06, "%m/%d/%Y %H:%M"))

# 3eme salve
# SOUTIEN SCOLAIRE . primaire . secondaire . lycée | primary_category1 | secondary_category1 . secondary_category2 . secondary_category3
proposal14 = Proposal.create!( name: "Atelier lecture", description: "Bonjour, je peux lire des histoires à des enfants pour décharger un peu les parents en télétravail...", proposer: user1, secondary_category: secondary_category1  )
proposal15 = Proposal.create!( name: "Devoirs école", description: "N'hésitez pas à me contacter pour aider vos enfants à faire leurs devoirs!", proposer: user1, secondary_category: secondary_category1 )
proposal16 = Proposal.create!( name: "préparation au brevet", description: "Bonjour, je fais réviser le brevet à mon fils aîné, nous pouvons le réviser avec un autre collégien :)", proposer: user1, secondary_category: secondary_category2  )
proposal17 = Proposal.create!( name: "Aide physique - chimie", description: "Hello, je suis étudiante en école d'ingé, je peux aider des collégiens avec leurs devoirs de physique-chimie!", proposer: user2, secondary_category: secondary_category2  )
proposal18 = Proposal.create!( name: "Histoire", description: "Passionné d'histoire, peut faire réviser desc cours!", proposer: user2, secondary_category: secondary_category2 )
proposal19 = Proposal.create!( name: "Prépa bac français", description: "Bonjour, je prépare le Capes en lettres, et propose d'aider des lycéens en pleine préparation du bac de français.", proposer: user2, secondary_category: secondary_category3  )
proposal20 = Proposal.create!( name: "Latin - Grec", description: "Aide en version et en thème ;)", proposer: user3, secondary_category: secondary_category3  )
proposal21 = Proposal.create!( name: "Anglais", description: "English native speaker would be happy to share some time helping young students!", proposer: user3, secondary_category: secondary_category3  )

Slot.create!( proposal: proposal14, start_time: DateTime.strptime("06/14/2020 19:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal14, start_time: DateTime.strptime("06/15/2020 20:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal14, start_time: DateTime.strptime("06/16/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal15, start_time: DateTime.strptime("06/17/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal16, start_time: DateTime.strptime("06/18/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal17, start_time: DateTime.strptime("06/19/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal18, start_time: DateTime.strptime("06/20/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal19, start_time: DateTime.strptime("06/21/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal20, start_time: DateTime.strptime("06/22/2020 10:00", "%m/%d/%Y %H:%M"))
Slot.create!( proposal: proposal21, start_time: DateTime.strptime("06/22/2020 10:00", "%m/%d/%Y %H:%M"))



puts "Creating bookings..."
booking1 = Booking.create!( reservation_status: "pending", chatroom: 12, booker: user1, proposal: proposal5, start_time: DateTime.strptime(proposal5_StarTime1, "%m/%d/%Y %H:%M"))
booking2 = Booking.create!( reservation_status: "booked",  chatroom: 3, booker: user2, proposal: proposal3  , start_time: DateTime.strptime(proposal3_StarTime1, "%m/%d/%Y %H:%M"))
booking3 = Booking.create!( reservation_status: "pending",  chatroom: 5, booker: user3, proposal: proposal2 , start_time: DateTime.strptime(proposal2_StarTime1, "%m/%d/%Y %H:%M"))

puts "Finished!"
