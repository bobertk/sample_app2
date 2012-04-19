# reset db w example user (= to existing one) plus 99 more
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do   # give Rake access to Rails environment
    # first user will be admin
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin) #set first user to admin

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,  # create! raises execptions
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)  # fake some microposts
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end