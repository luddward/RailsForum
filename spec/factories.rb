# This will guess the User class
FactoryGirl.define do

  factory :user, class: User do
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    email                 { Faker::Internet.email }
    username              { Faker::Name.name}
    admin                 false
    password              'password'
    password_confirmation 'password'
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
  end

  factory :category, class: Category do
    name 'General Discussions'
  end


  factory :post, class: Post do
    title 'First Post'
    content 'Welcome to the rails forum'
    association :user, factory: :user
    association :category, factory: :category
  end

end