require 'cloudinary'
require 'open-uri'
User.destroy_all

User.create!([
  { email: 'fiona.pasteur@example.com', password: 'password123', first_name: 'Fiona', last_name: 'Pasteur', birthdate: '1986-10-05', level: 1 },
  { email: 'lisette.auguste@example.com', password: 'password123', first_name: 'Lisette', last_name: 'Auguste', birthdate: '1990-01-01', level: 1 },
  { email: 'anna.leger@example.com', password: 'password123', first_name: 'Anna', last_name: 'Leger', birthdate: '1985-02-14', level: 2 },
  { email: 'chloe.jacquier@example.com', password: 'password123', first_name: 'Chloé', last_name: 'Jacquier', birthdate: '1992-03-22', level: 3 },
  { email: 'manon.vidal@example.com', password: 'password123', first_name: 'Manon', last_name: 'Vidal', birthdate: '1988-04-10', level: 1 },
  { email: 'margot.briere@example.com', password: 'password123', first_name: 'Margot', last_name: 'Brière', birthdate: '1993-05-30', level: 2 },
  { email: 'emilie.suchet@example.com', password: 'password123', first_name: 'Emilie', last_name: 'Suchet', birthdate: '1991-06-25', level: 3 },
  { email: 'eve.chapuis@example.com', password: 'password123', first_name: 'Eve', last_name: 'Chapuis', birthdate: '1987-07-15', level: 1 },
  { email: 'elisabeth.beauchamp@example.com', password: 'password123', first_name: 'Elisabeth', last_name: 'Beauchamp', birthdate: '1989-08-20', level: 2 },
  { email: 'sylvie.blanc@example.com', password: 'password123', first_name: 'Sylvie', last_name: 'Blanc', birthdate: '1989-08-20', level: 2 },
  { email: 'josephine.plantin@example.com', password: 'password123', first_name: 'Joséphine', last_name: 'Plantin', birthdate: '1978-08-20', level: 2 },
  { email: 'benjamin.martin@example.com', password: 'password123', first_name: 'Benjamin', last_name: 'Martin', birthdate: '1990-01-01', level: 1 },
  { email: 'nicolas.buisson@example.com', password: 'password123', first_name: 'Nicolas', last_name: 'Buisson', birthdate: '1985-02-14', level: 2 },
  { email: 'olivier.derocles@example.com', password: 'password123', first_name: 'Olivier', last_name: 'Derocles', birthdate: '1992-03-22', level: 3 },
  { email: 'lucas.jacquard@example.com', password: 'password123', first_name: 'Lucas', last_name: 'Jacquard', birthdate: '1988-04-10', level: 1 },
  { email: 'matthieu.bardot@example.com', password: 'password123', first_name: 'Matthieu', last_name: 'Bardot', birthdate: '1993-05-30', level: 2 },
  { email: 'daniel.dumont@example.com', password: 'password123', first_name: 'Daniel', last_name: 'Dumont', birthdate: '1991-06-25', level: 3 },
  { email: 'pierre.cartier@example.com', password: 'password123', first_name: 'Pierre', last_name: 'Cartier', birthdate: '1987-07-15', level: 1 },
  { email: 'paul.dupuis@example.com', password: 'password123', first_name: 'Paul', last_name: 'Dupuis', birthdate: '1989-08-20', level: 2 },
  { email: 'jacques.chevalier@example.com', password: 'password123', first_name: 'Jacques', last_name: 'Chevalier', birthdate: '1994-09-12', level: 3 },
])

User.find_each.with_index do |user, index|
  photo_path = Rails.root.join('app', 'assets', 'images', "photos", "#{"%02d" % (index + 1)}.png")
  user.photo.attach(io: File.open(photo_path), filename: "#{user.first_name} photo")
  user.save!
  puts "#{user.first_name} has been seeded ! 🥳🥳"
end


Spot.destroy_all

spots = [
  {
    name: "Côte des Basques",
    description: "Located in Biarritz, Côte des Basques is a famous surfing spot known for its scenic views and consistent waves. Ideal for both beginners and experienced surfers.",
    location: "Biarritz, Pays Basque",
    longitude: -1.567850,
    latitude: 43.478420,
    difficulty: 2,
    wave_type: "Beach break",
    crowd: "High",
    average_rating: 4.5,
    photo_url: "https://cdt64.media.tourinsoft.eu/upload/Cote-des-Basques-Biarritz-Ocean--4-.jpg?width=1800"
  },
  {
    name: "Plage du Club",
    description: "Anglet's Plage du Club offers powerful waves and a vibrant surfing community. It's a favorite among locals and tourists alike.",
    location: "Anglet, Pays Basque",
    longitude: -1.53612,
    latitude: 43.51001,
    difficulty: 3,
    wave_type: "Beach break",
    crowd: "High",
    average_rating: 4.7,
    photo_url: "https://cdt64.media.tourinsoft.eu/upload/Plage-du-Club---Anglet--RiBLANC.jpg"
  },
  {
    name: "Hendaye",
    description: "Hendaye is perfect for beginners, featuring gentle and long waves. It's also known for its beautiful sandy beach and family-friendly atmosphere.",
    location: "Hendaye, Pays Basque",
    longitude: -1.774257,
    latitude: 43.373543,
    difficulty: 1,
    wave_type: "Beach break",
    crowd: "Medium",
    average_rating: 4.3,
    photo_url: "https://www.barnes-cotebasque.com/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBaXRPIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--45685916c2bccd0f543eef441f4b4d7929e8fe9d/surf-pays-basque.jpg"
  },
  {
    name: "Guéthary",
    description: "Guéthary is renowned for its big wave surfing. It's a spot for the more experienced, offering challenging and powerful waves.",
    location: "Guéthary, Pays Basque",
    longitude: -1.61697,
    latitude: 43.42453,
    difficulty: 3,
    wave_type: "Reef break",
    crowd: "Medium",
    average_rating: 4.6,
    photo_url: "https://images.ctfassets.net/4h67cva1xuos/1pi3eCRAZl9i2XSNepNH40/2e6de0366d28aabb5fae562ae496d290/Guethary-Antonin_de_Soultrait__Parlementia_Dominique_Reis.jpg"
  },
  {
    name: "Erretegia",
    description: "Erretegia in Bidart offers scenic beauty and consistent waves, making it a great spot for all levels of surfers.",
    location: "Bidart, Pays Basque",
    longitude: -1.58993,
    latitude: 43.44592,
    difficulty: 2,
    wave_type: "Beach break",
    crowd: "Medium",
    average_rating: 4.4,
    photo_url: "https://www.bidarttourisme.com/wp-content/uploads/wpetourisme/Erretegia--3--1200x800.jpg"
  },
  {
    name: "Plage de la Sud",
    description: "Hossegor's Plage de la Sud is a world-renowned surfing destination, famous for its powerful and hollow waves. It's a hotspot for professional surfers.",
    location: "Hossegor, Landes",
    longitude: -1.440373,
    latitude: 43.668603,
    difficulty: 3,
    wave_type: "Beach break",
    crowd: "High",
    average_rating: 4.8,
    photo_url: "https://watermansport-surfschool.com/wp-content/uploads/2021/02/ws-les-spots-la-sud.jpg"
  },
  {
    name: "Plage des Estagnots",
    description: "Seignosse's Plage des Estagnots offers powerful and fast waves, ideal for advanced surfers. The spot is known for its natural beauty and vibrant surfing culture.",
    location: "Seignosse, Landes",
    longitude: -1.44072,
    latitude: 43.68676,
    difficulty: 3,
    wave_type: "Beach break",
    crowd: "Medium",
    average_rating: 4.7,
    photo_url: "https://lh6.googleusercontent.com/proxy/f1ecf-QCSwg9rqP-HZ0ekQPna-269U_7a4sm91MB2xrzyQT073Zrvz7nqa2awC4PVR1v7EE2eGEkXSrLAScqDwiAlUoYEZNJnExcE9eicLc_6OQB4w"
  },
  {
    name: "Vague de la Gravière",
    description: "Capbreton's Vague de la Gravière is known for its heavy and challenging waves, making it a spot for experienced surfers. It's a thrilling spot with a strong local scene.",
    location: "Capbreton, Landes",
    longitude: -1.44755,
    latitude: 43.64123,
    difficulty: 3,
    wave_type: "Beach break",
    crowd: "High",
    average_rating: 4.7,
    photo_url: "https://www.surf-forecast.com/system/images/15868/large/La-Graviere.jpg?1457988917"
  },
  {
    name: "Mimizan",
    description: "Mimizan offers a variety of waves suitable for all levels. It's a laid-back spot with a welcoming atmosphere, ideal for a relaxed surfing experience.",
    location: "Mimizan, Landes",
    longitude: -1.281650,
    latitude: 44.201351,
    difficulty: 2,
    wave_type: "Beach break",
    crowd: "Medium",
    average_rating: 4.2,
    photo_url: "https://www.tourismelandes.com/wp-content/uploads/2019/01/surf-mimizan.jpg"
  },
  {
    name: "Biscarrosse",
    description: "Biscarrosse is a popular surfing destination with consistent and powerful waves. It's a great spot for intermediate to advanced surfers.",
    location: "Biscarrosse, Landes",
    longitude: -1.24695,
    latitude: 44.44506,
    difficulty: 2,
    wave_type: "Beach break",
    crowd: "Medium",
    average_rating: 4.5,
    photo_url: "https://www.biscagrandslacs.com/sites/default/files/styles/ogimage/public/medias/images/surf-ocean-cote-landes-biscarrosse.jpg.webp?itok=SnUttJBY"
  },
  {
    name: "Lacanau",
    description: "Lacanau is famous for its long sandy beaches and consistent waves. It's a versatile spot suitable for surfers of all levels, offering a vibrant local surf culture.",
    location: "Lacanau, Gironde",
    longitude: -1.19492,
    latitude: 44.9912,
    difficulty: 2,
    wave_type: "Beach break",
    crowd: "High",
    average_rating: 4.3,
    photo_url: "https://www.medoc-atlantique.com/wp-content/uploads/2019/02/surf-vladimir-kudinov-1600x900.jpg"
  },
  {
    name: "Carcans",
    description: "Carcans offers a quieter alternative with powerful waves and fewer crowds. It's an ideal spot for those seeking a more relaxed surfing experience.",
    location: "Carcans, Gironde",
    longitude: -1.186893,
    latitude: 45.082631,
    difficulty: 2,
    wave_type: "Beach break",
    crowd: "Low",
    average_rating: 4.1,
    photo_url: "https://www.carcans.fr/carcans/images/bandeau_plage-lever.jpg"
  },
  {
    name: "Le Porge",
    description: "Le Porge is known for its pristine beaches and excellent surfing conditions. It's a great spot for all levels, offering a serene and natural setting.",
    location: "Le Porge, Gironde",
    longitude: -1.212208,
    latitude: 44.893304,
    difficulty: 2,
    wave_type: "Beach break",
    crowd: "Low",
    average_rating: 4.2,
    photo_url: "https://www.medocpleinsud.com/wp-content/uploads/2021/11/lowres-0443.jpg"
  },
  {
    name: "Plage de Saint-Nicolas",
    description: "Le Verdon-sur-Mer's Plage de Saint-Nicolas offers gentle waves suitable for beginners and families. It's a peaceful spot with beautiful surroundings.",
    location: "Le Verdon-sur-Mer, Gironde",
    longitude: -1.098020,
    latitude: 45.559360,
    difficulty: 1,
    wave_type: "Beach break",
    crowd: "Low",
    average_rating: 4.0,
    photo_url: "https://oceanadventure.surf/wp-content/uploads/2023/11/peniche-supertubos.webp"
  },
  {
    name: "Le Cap Ferret",
    description: "Le Cap Ferret is a versatile surfing spot with waves for all levels. It's known for its stunning views and vibrant local culture.",
    location: "Le Cap Ferret, Gironde",
    longitude: -1.251200,
    latitude: 44.623061,
    difficulty: 2,
    wave_type: "Beach break",
    crowd: "Medium",
    average_rating: 4.3,
    photo_url: "https://lh6.googleusercontent.com/proxy/G0W-2WM3ZPx7-PoBT8qIT0HZJZNHEHFmovecLlpPBeu_mRnekFUmfcgs2yy5H-JA_2L-F_eSOtAushnARgwDFb9mHvKv47dBYilKW3VZ1IpBn5CdcWNu4aX1Av-T9hSDCHE2n2KwlFDqorADuroJlOwuhAXgsw"
  }
]

spots.each do |spot|
  new_spot = Spot.create!(
    name: spot[:name],
    description: spot[:description],
    location: spot[:location],
    longitude: spot[:longitude],
    latitude: spot[:latitude],
    difficulty: spot[:difficulty],
    wave_type: spot[:wave_type],
    crowd: spot[:crowd],
    average_rating: spot[:average_rating]
  )

  photo_file = URI.open(spot[:photo_url])

  # Determine the file extension from the URL or default to .jpg
  extension = File.extname(URI.parse(spot[:photo_url]).path).downcase
  extension = '.jpg' if extension.empty? || extension == '.jpeg'

  # Construct a filename for the attachment
  filename = "#{spot[:name]}-#{spot[:location]}-#{SecureRandom.hex(8)}#{extension}"

  # Attach the image to the offer with the correct content type for JPEG
  new_spot.photos.attach(io: photo_file, filename: filename, content_type: "image/jpeg")
end
