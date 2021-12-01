User.create!(
  name: "Admin",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  birthday: "1999/08/06",
  gender: "Male",
  admin: true
)

19.times do |n|
  name = Faker::Name.name
  email = "admin-#{n+1}@railstutorial.org"
  password = "123456"
  birthday = "1999/08/06"
  gender = "Male"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    birthday: birthday,
    gender: gender
  )
end
