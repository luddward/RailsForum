# This will guess the User class
FactoryGirl.define do

  factory :user do
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    email                 { Faker::Internet.email }
    username              'john'
    admin                 false
    password              'password'
    password_confirmation 'password'
    avatar                File.open(File.join(Rails.root, '/public/default-user.png'))
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name            'Admin'
    last_name             'User'
    username              'admin'
    email                 'admin@localhost.com'
    admin                 true
    password              'password'
    password_confirmation 'password'
    avatar                File.open(File.join(Rails.root, '/public/default-user.png'))
  end

end