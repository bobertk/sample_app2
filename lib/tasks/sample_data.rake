# reset db w example user (= to existing one) plus 99 more
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do   # give Rake access to Rails environment
    make_users
    make_microposts
    make_relationships
  end

  def make_users
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
  end

  def make_microposts
    users = User.all(limit: 6)  # fake some microposts
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end

  def make_relationships
    users = User.all
    user  = users.first
    followed_users = users[2..50]  # 1st user follows 3- 51
    followers      = users[3..40]  # users 4 - 41 follow 1st user back
    followed_users.each { |followed| user.follow!(followed) }
    followers.each      { |follower| follower.follow!(user) }
  end 
end