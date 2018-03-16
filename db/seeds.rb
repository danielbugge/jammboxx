# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
JammPlayer.destroy_all
Instrument.destroy_all
InstrumentType.destroy_all
Jamm.destroy_all
User.destroy_all
Genre.destroy_all

counter = 1

# GENRE
genre_array = [ "Blues", "Classical", "Hip Hop / Rap", "Indie", "Jazz", "Latin", "Reggae", "Rock", "Folk", "Metal"]

genre_array.each do |genre|
  Genre.create!( name: genre)
  puts "Genre ##{counter} done!"
  puts "\n"
  counter += 1
end

# INSTRUMENTS TYPES MODEL
instrument_types_array = [ "Bass Guitar", "Drum Set", "Electric guitar", "Flute", "Harp", "Maracas", "Piano",
                           "Saxophone","Triangle","Trumpet","Violoncello"]

counter = 1

instrument_types_array.each do |instrument|
 InstrumentType.create!( name: instrument,
                          icon_url: instrument)
  puts "Instrument type ##{counter} done!"
  puts "\n"
  counter += 1
end

counter = 1

# USER
50.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456',
    username: Faker::Internet.user_name + rand(01..99).to_s,
    genre_id: Genre.ids.sample,
    picture: "p#{rand(1..53)}",
    # remote_avatar_url: "http://res.cloudinary.com/dlopez10g/image/upload/v1520878724/qhwrkr8ycjj18s3opqn6.png"
    )
  puts "Users ##{counter} done!"
  puts "\n"
  counter += 1
end

counter = 1

# Instruments Join Table
150.times do
  Instrument.create!(
    model: Faker::LordOfTheRings.location,
    user_id: User.ids.sample,
    instrument_type_id: InstrumentType.all.sample.id
    )
  puts "Instrument ##{counter} done!"
  puts "\n"
  counter += 1
end
# JAMMS

address_array = ["8 Nugent Rd, London N19 3QF, UK","15 Meadow Rd, Windermere LA23 2EU, UK","21 Gosforth Rd, Seascale CA20 1PW, UK","1 Dunlop St, Greenock PA16 9BG, UK","46 Hillview Rd, Worthing BN14 0BX, UK","1 Duguid Dr, Saltcoats KA21 6LW, UK","Oakenden Ln, Edenbridge TN8, UK","65 Warstock Rd, Birmingham B14 4RX, UK","B4403, Bala LL23, UK","47 Greenburn Dr, Aberdeen AB21 9ER, UK","Barnwell Dr, Cambridge CB5 8UU, UK","4 Stane Grove, Shotts ML7 5GA, UK","Grand Union Canal Walk, Hayes, UK","27 Morgan Ave, Sheffield S5 8QH, UK","2 Silverwell Walk, Liverpool L11 6LL, UK","24 Westhill Park, Highgate, London N6 6ND, UK","5 Braeriach Ct, Aviemore PH22 1TL, UK","89-91 A107, Cazenove, London E5 9BU, UK","41-43 Moreton St, Pimlico, London SW1V 2NY, UK","20 Agnes Cl, London E6 5PH, UK","Exmouth Rd, Exeter EX3, UK","200 Pennymead, Harlow CM20 3JE, UK","2 Langley Rd, Swindon SN5, UK","24 Wentworth Rd, London E12 5BD, UK","56 Fox St, Greenock PA16 8QS, UK","11 Thurlow Ave, Herne Bay CT6 6JF, UK","Brick Cl, Kiln Farm, Milton Keynes MK11, UK","5 Myatt Cl, Wolverhampton WV2 2DJ, UK","A846, Isle of Islay PA43 7JF, UK","1 Bassenthwaite Rd, Benfleet SS7 3JG, UK","6 Pittman Way, Fulwood, Preston PR2 9YW, UK","100 Sandygate Grove, Sheffield S10 5SZ, UK","49 Harleston Way, Gateshead NE10 9BQ, UK","218 Chichester Rd, Bognor Regis PO21 5BE, UK","12 Grimsby Rd, Laceby, Grimsby DN37 7DB, UK","8 Edgars Ct, Welwyn Garden City AL7 3SR, UK","111 Glynwood Ct, Forest Hill, London SE23 3HU, UK","A701, Moffat DG10 9PQ, UK","B8008, Arisaig PH39 4NL, UK","7 Stonefield, Tarskavaig, Isle of Skye IV46 8SB, UK","17-29 Greeto Falls Ave, Largs KA30 9HH, UK","7 Harold Wilson Dr, Hesleden, Hartlepool TS27 4PQ, UK","4 Dychurch Ln, Northampton NN1 2AB, UK","21 Onslow Rd, New Malden KT3 4AR, UK","Llantwit Major Rd, Cowbridge CF71 7PF, UK","Dalzell St, United Kingdom","82 Topsham Rd, Smethwick B67 7LZ, UK","125 Argyle Rd, London W13 0DB, UK","1 Louise Gardens, Rainham RM13 8LH, UK","6 Ranmoor Hill, Hathersage, Hope Valley S32 1BU, UK","South London Mail Centre, 53 Nine Elms Ln, London SW8 5BB, UK","Dalzell St, United Kingdom","24 Winding Mill S, Brierley Hill DY5 2LW, UK","5 Seagrave Ct, Northampton NN3 8UH, UK","325 Birmingham Rd, Sutton Coldfield B72 1EH, UK","Unnamed Road, Isle of Mull PA67 6DW, UK","145 High St, Slough SL1 1EX, UK","8 Park Rd, Kiddington, Woodstock OX20 1BL, UK","B8021, Gairloch IV21 2BT, UK","Unnamed Road, Goodwick SA64 0JG, UK","1 Ffordd Caergybi, Cemaes Bay LL67 0LT, UK","Manor Rd, Abbots Leigh, Bristol BS8 3RP, UK","2 North Rd, Okehampton EX20 1BE, UK","8 North Ave, Burton Latimer, Kettering NN15 5PG, UK","6 Blackwater Cl, Rainham RM13 8UA, UK","Fairweather Court, 1A Lakeside Rd, London N13 4PW, UK","9 Clarendon St, Nottingham NG1 5HR, UK","17A Snowberry Cl, Taverham, Norwich NR8 6YQ, UK","Unnamed Road, Inverurie AB51 7JR, UK","14 Peaches Cl, Sutton SM2 7BJ, UK","67 Central Ave, Enfield EN1 3QF, UK","Brington Ln, Daventry NN11 2NR, UK","Rose Cottage, 5 Union Rd, Linlithgow EH49 7DY, UK","B1108, Thetford IP26 5BX, UK","2 Chapel St, Ermington, Ivybridge PL21 9ND, UK","1 Rankin Dr, Largs KA30 9DA, UK","Bassetts Ln, Mayfield TN20 6NX, UK","13 Malthouse Road, London SW8, UK","98-100 Canal St, Perth PH2 8HX, UK","89 Queens Walk, Ruislip HA4 0NN, UK","22 Lordsfield Ave, Ashton-under-Lyne OL7 9BT, UK","1 Devonshire Terrace, Coniston LA21 8HG, UK","4 Swardeston Ln, East Carleton, Norwich NR14 8LF, UK","Church Ln, Market Rasen LN8 6JP, UK","A83, Tarbert PA29 6SX, UK","Copperas Ln, Droylsden, Manchester M43 6AR, UK","3 Osborne Pl, Lower St, Merriott TA16 5NP, UK","Unnamed Road, Isle of Islay PA45 7QP, UK","45 Brook St, Twyford, Reading RG10, UK","Denehurst Guest House, 40 Queen's Dr, Windermere LA23 2EL, UK","2 Clapton Rd, Crewkerne TA18, UK","47 Cuillins Ave, Port Glasgow PA14 6LU, UK","Nursery Ln, Hull HU6, UK","9 Boynton Rd, East Cowton, Northallerton DL7 0EA, UK","40 Brian Ave, Waltham, Grimsby DN37 0JS, UK","Unnamed Road, Amlwch LL68 0NT, UK","Lodge Cottage, Broseley TF12 5BP, UK","Queens House, 42-44 New St, Honiton EX14 1BJ, UK","17-19 The Den, Dalry KA24 4JG, UK","2b Dodd Rd, Watford WD24 5FN, UK","Largo Rafael Bordalo Pinheiro, 30, Chiado, Lisboa 1200-369","Rua de São Nicolau, 17, Baixa, Lisboa","Avenida da República, 25A, Saldanha, Lisboa","Rua da Rosa, 321, Príncipe Real, Lisboa","Rua Serpa Pinto, 10C, Chiado, Lisboa","Rua de Santos-O-Velho, 2/4, Santos, Lisboa 1200-812","Praça do Príncipe Real, 28A/D, Príncipe Real, Lisboa","Calçada do Patriarcal, 40, Príncipe Real, Lisboa","Rua Doutor João Soares, 8B, Campo Grande, Lisboa","Rua da Esperança, 33, Madragoa, Lisboa","Avenida Elias Garcia, 180B, Praça de Espanha, Lisboa 1050-153","Avenida 24 de Julho, 68F, Santos, Lisboa","Alameda Santo António dos Capuchos, Jardim dos Sabores, Pena, Lisboa","Rua Luís de Freitas Branco, 5D, Lumiar, Lisboa 1600 488","Rua Artilharia 1, 16, Rato, Lisboa","Pavilhão Poente, Avenida Brasília, Belém, Lisboa","Praceta Professor Alfredo de Sousa, 4B, Algés, Oeiras 1495-241","Urbanização Colinas do Cruzeiro, Rua Pulido Valente, 5 Loja 3, Odivelas Centro, Odivelas","Rua da Escola Politécnica, 32, Príncipe Real, Lisboa 1250-102","Avenida Duque de Ávila, 26B R/C, Saldanha, Lisboa","Rua Nova da Trindade, 18, Chiado, Lisboa","Rua Alfredo Keil, 16, Venteira, Amadora","Rua da Moeda, 1C, Cais do Sodré, Lisboa","Passeio Marítimo de Algés, Algés, Oeiras","Rua Nova da Trindade, 10, Lisboa, Greater Lisbon","Rua do Pólo Sul, 15C, Parque das Nações, Lisboa 1990-092","Rua da Boavista, 16, Cais do Sodré, Lisboa 1200 - 067","Avenida Infante Dom Henrique, Cais da Pedra, Armazém B, Loja 7, Santa Apolónia, Lisboa","LX Factory, Rua Rodrigues Faria, 103, Edifício I, Piso 0, Espaço 0.1F, Alcântara, Lisboa","Rua Carlos Testa, 1B, Praça de Espanha, Lisboa","Avenida 24 de Julho, 50, Santos, Lisboa","Rua Vítor Cordon, 26, Chiado, Lisboa","Rua Bernardim Ribeiro, 5B, Venteira, Amadora 2700-111 A","Avenida António Augusto Aguiar, 148A, Praça de Espanha, Lisboa 1050-021 L","Travessa de Santa Marta, 4, Pena, Lisboa","Rua Barata Salgueiro, 28, Avenida da Liberdade, Lisboa","Avenida Defensores de Chaves, 55, Saldanha, Lisboa","Avenida Elias Garcia, 172A, Praça de Espanha, Lisboa","Travessa do Pregoeiro, 16, Carnide, Lisboa","Rua de Santa Marta, 37A-C, Avenida da Liberdade, Lisboa","Avenida Visconde Valmor, 40A, Campo Pequeno, Lisboa 1050 240","Rua da Rosa, 317, Príncipe Real, Lisboa","Rua da Artilharia 1, 87A, Rato, Lisboa","Avenida João Crisóstomo, 38A, Saldanha, Lisboa","Avenida Almirante Reis, 1H, Mouraria, Lisboa","Avenida Duque de Ávila, 42, Saldanha, Lisboa 1050-083","Rua de Moçambique, 2, Anjos, Lisboa","Praça da República, 14A, Jardins da Amoreira, Ramada, Odivelas","Centro Comercial Alvalade, Praça de Alvalade, 6, Loja 9/10, Alvalade, Lisboa","Centro Cultural de Belém, Praça do Império, Jardim das Oliveiras, Belém, Lisboa","Rua dos Remolares, 34, Cais do Sodré, Lisboa","Rua Barata Salgueiro, 37A, Avenida da Liberdade, Lisboa","Avenida Dom João II, 1.17.02 B, Parque das Nações, Lisboa","Avenida Duque de Ávila, 44, Saldanha, Lisboa","Avenida da Liberdade, 2","Estrada de Benfica, 571, Benfica, Lisboa","Rua da Pimenta, 9, Parque das Nações, Lisboa","Avenida de Brasília, Champalimaud Centre For the Unknown, Ala B, Belém, Lisboa","Rua de Belém, 84-92, Belém, Lisboa"]
title_array = ["Trial Jamm in my new apartment!", "Wonderful Jamm", "Jamm with friends", "Jamm in nice studio in Lisbon", "Nice Jamm Sesh", "Moved to Lisbon!", "Blues Jamm", "Heavy Metal Jamm", "Jamm in Lisbon", "Jamm in London", "Cool Jazz get together", "Jamm sesh with awesome view", "Amazing studio", "Nice sound quality in this place", "Sonic perfection", "Little small but good sound", "Musical get-together", "WTF Lisbon is so cool lets jamm", "Amazing jamm session in good quality studio", "Nice place with nice food, lets jamm", "Cool alternative apartment to jamm in"]
description_array = ["Wanted to get a few friends together to jamm after work", "Ive got a passion for Jazz and Blues and really wanted to get a few people together to go on a 7 hour bender", "I was tired of trying to organise something in a studio nearby, found this app and decided to start a jamm in my living room, anyone welcome", "Into metal and dont have all the equipment but have a drum set so people are welcome to come along with their own instruments", "I have a small little apartment and really have been meaning to bring people over for a while to jamm", "Finally have a few hours to spare, just lost my job and have a free house most of the time so really have been meaning to get a few people together", "Ive got a really nice piano at home, please bring some guitars and we can have a nice sesh", "Its abit late but hope you guys can make it at 9, I have a cool living room with alot of space", "I have tried and tried to organise jamms in studios but its impossible to organise", "My drum set is awesome, please bring some other instruments", "Hellooooooo Guyyyyysssss!!!!!! Please bring whatever instrument you want and come join me a my friends for an awesome jamm"]
counter = 1

40.times do
  Jamm.create!(
    name: title_array.sample,
    description: description_array.sample,
    address: address_array.sample,
    date: Faker::Date.forward(30),
    duration: rand(1..3),
    genre_id: Genre.all.sample.id,
    max_players: rand(2..10),
    level: ["Beginner", "Intermediate", "Expert"].sample,
    allow_new_instrument: [true, false].sample,
    photo: rand(1..23).to_s,
    time: rand(1..23),
    user_id: User.all.sample.id
    )
  puts "Jamm ##{counter} done!"
  puts "\n"
  counter += 1
end

## JAMM PLYERS

counter = 1

Jamm.all.each do |jam|
  ts = rand(1..jam.max_players)
  ts.times do
    user_id = User.all.sample.id
    if Instrument.where(user_id: user_id).empty?
     instrument_played_id = Instrument.all.sample.id
    else
      instrument_played_id = Instrument.where(user_id: user_id).sample.id
    end
    new_jamm_player = JammPlayer.create!(jamm_id: jam.id, user_id: user_id, instrument_id: instrument_played_id)
  end
  puts "Jamm player joint ##{counter} done!"
  puts "\n"
  counter += 1
end

50.times do
  jamm = Jamm.where.not(instrument_ids: []).sample
  JammPlayer.create!(
    jamm_id: jamm.id,
    user_id: nil,
    instrument_id: jamm.instrument_ids.sample
    )
  jamm.update!(max_players: jamm.max_players += 2)
  puts "Jamm player joint ##{counter} done!"
  puts "\n"
  counter += 1
end

User.create!(email: 'ciao@ciao.com', password: '123456', username: 'ciaobello', genre_id: Genre.first.id, picture: "p#{1}", avatar: "p#{rand(1..20)}")
Instrument.create!(model: Faker::LordOfTheRings.location, user_id: User.last.id, instrument_type_id: InstrumentType.all.sample.id)

puts "basic user --- > email: 'ciao@ciao.com' password: '123456'"
puts "\n"
completed = <<-ENDTEXT
                                  ,,   ,  ,,
                                :      ::::,    :::,
                   ,        ,,: :::::::::::::,,  ::::   :  ,
                 ,       ,,,   ,:::::::::::::::::::,  ,:  ,: ,,
            :,        ::,  , , :, ,::::::::::::::::::, :::  ,::::
           :   :    ::,                          ,:::::::: ::, ,::::
          ,     ,:::::                                  :,:::::::,::::,
      ,:     , ,:,,:                                       :::::::::::::
     ::,:   ,,:::,         Man this seed is super nice!      ,::::::::::::,
    ,:::, :,,:::                                               ::::::::::::,
   ,::: :::::::,               wubba dubba dub dub              ,::::::::::::
   :::,,,::::::                                                   ::::::::::::
 ,:::::::::::,                  Don't get me worng                ::::::::::::,
 :::::::::::,                                                     ,::::::::::::
:::::::::::::                       It's ok                       ,::::::::::::
::::::::::::                                                       ::::::::::::
::::::::::::                                                      ,::::::::::::
:::::::::::,                                                      , :::::::::::
,:::::::::::::,                brought to you by                 ,,::::::::::::
::::::::::::::                                                    ,::::::::::::
 ::::::::::::::,                    JPdoubleD                    ,:::::::::::::
 ::::::::::::,            Jeremy Paolo Daniel & Daniel           , ::::::::::::
  :,::::::::: ::::                                               :::::::::::::
   ,:::::::::::  ,:                                          ,,:::::::::::::,
     ::::::::::::                                           ,::::::::::::::,
      :::::::::::::::::,                                  ::::::::::::::::
       :::::::::::::::::::,                             ::::::::::::::::
        ::::::::::::::::::::::,                     ,::::,:, , ::::,:::
          :::::::::::::::::::::::,               ::,: ::,::, ,,: ::::
              ,::::::::::::::::::::              ::,,  , ,,  ,::::
                 ,::::::::::::::::              ::,, ,   ,:::,
                      ,::::                         , ,,
                                                  ,,,
ENDTEXT
puts completed
