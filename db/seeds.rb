conditions = Condition.create([
  { name: "Worn", description: "Book is in poor aesthetic condition that will usually require repair or work. " },
  { name: "Fair", description: "Book has a generally decent aesthetic although they're not free of small cosmetic issues/blemishes." },
  { name: "Good", description: "Book is mostly aesthetic, however, may have some slight cosmetic blemishes." },
  { name: "Excellent", description: "Book is in almost-new or new condition, free of any signs of wear or blemishes." }
])

genre = Genre.create([
  { name: "Romance", description: "T Shirts, button ups, and suit tops." },
  { name: "Sci-fi", description: "Shorts, pants, swim wear, and suit pants." },
  { name: "Fiction", description: "General flip-flops and footwear." },
  { name: "Non-fiction", description: "Caps, hats, fedoras, and sombreros." },
  { name: "Thriller", description: "Fashion and reading glasses." },
  { name: "Picture", description: "Work and casual ties." }
])


for i in 1..5
  user = User.new(
    name: Faker::Name.first_name + " " + Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "obvious",
    postcode: rand(2000..4500),
  )
  user.save!
  puts "Created user #{ user.name} "
end

for i in 1..5
  user = User.order('RANDOM()').first
  genre = Genre.order('RANDOM()').first
  condition = Condition.order('RANDOM()').first 
  
  book = Book.new(
  price: rand(400..2000),
  purchased: false,
  condition_id: condition.id,
  genre_id: genre.id,
  user_id: user.id,
  title: Faker::Lorem.words(1),
  description: Faker::Lorem.words(number: 50),
  location: rand(1500..4500),
  )
  book.save!
  puts "Created book #{ book.title} "
end

#Passing `number` with the 1st argument of 
#`words` is deprecated. Use keyword argument like `words(number: ...)` instead.
  #temp_prod_file = Down.download(Faker::LoremFlickr.image(size: "300x300", search_terms: ['book', 'novel']))
  #prod.picture.attach(io: temp_prod_file, filename: File.basename(temp_prod_file.path))

  #prod.save!
  #puts "Created a #{ genre.name } novel called #{ book.name } belonging to #{ user.name } in #{ condition.name } condition."


  

#for i in 1..5
  #user = User.order('RANDOM()').first
  #genre = Genre.order('RANDOM()').first
  #condition = Condition.order('RANDOM()').first
#for i in 1..5
  #  book = Book.new(
  #  price: rand(400..2000),
  #  location: rand(1500..4500),
  #  purchased: false
  #)
#end
  #temp_prod_file = Down.download(Faker::LoremFlickr.image(size: "300x300", search_terms: ['hats', 'clothes']))
  #prod.picture.attach(io: temp_prod_file, filename: File.basename(temp_prod_file.path))

  #prod.save!
  #puts "Generated a book called #{ prod.name } owned by #{ user.name } in #{ condition.name } condition."



#for i in 1..100
 #   genre = Genre.order('RANDOM()').first
  #  conditions = Condition.order('RANDOM()').first
   # book = Book.new(
    #price: rand(5000..99900),
    #location: rand(1000..4999),
    #purchased: false
#)
#end