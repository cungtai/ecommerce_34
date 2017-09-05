10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "123456"
  phone = "0909090"
  address = "Da Nang"
  gravatar_id = Digest::MD5::hexdigest(email.downcase)
  size = 80
  avatar = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"

  User.create!(name: name, avatar: avatar, email: email, phone: phone,
    address: address, password: password)
end

3.times do |n|
  info = "Payment Info"
  payments = ["Bank Tranfer","Cash","Ship COD"]
  name = payments[rand(0..2)]
  Payment.create!(name: name, payment_info: info)
end

10.times do |n|
  user_id = rand(1..10)
  receiver_name  = Faker::Name.name
  receiver_email = "example-#{n+1}@railstutorial.org"
  receiver_phone = "0909090"
  amount = 100
  payment_id = rand(1..3)
  message = "Message"
  status = rand(1..3)

  Order.create!(user_id: user_id,
    receiver_name: receiver_name, receiver_email: receiver_email,
    receiver_phone: receiver_phone, amount: amount,
    payment_id: payment_id, message: message, status: status)
end
6.times do |n|
  name  = Faker::Company.name[0..40]
  sort_order = Faker::Number.number(1)
  Catalog.create!(name: name, sort_order: sort_order)
end

10.times do |n|
  name  = Faker::Name.name
  description = "example-#{n+1}@railstutorial.org"
  email = "example-#{n+1}@railstutorial.org"
  catalog_id = rand(1..3)
  user_id = rand(1..3)
  gravatar_id = Digest::MD5::hexdigest(email.downcase)
  size = 80
  avatar = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  price = 80

  SuggestProduct.create!(catalog_id: catalog_id, user_id: user_id, name: name,
    description: description, image: avatar, price: price)
end
