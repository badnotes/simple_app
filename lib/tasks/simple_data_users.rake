namespace :db do 
	desc ""
	task populate: :environment do
		admin = User.create!(name: "jovan",
			email: "whx10000@gmail.com",
			password: "wanjun",
			password_confirmation: "wanjun")
		admin.toggle!(:admin)
		99.times do |n|
			name = Faker::Name.name
			email = "user-#{n+1}@example.org"
      			password = "password"
      			User.create!(name: name,
	                   	email: email,
	                   	password: password,
	                   	password_confirmation: password)
      		end
      	end
end