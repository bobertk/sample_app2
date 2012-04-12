FactoryGirl.define do
  factory :user do  # symbol :user says definition is for User model object
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end