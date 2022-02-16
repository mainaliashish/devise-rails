FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Internet.username }
    email { Faker::Internet.unique.email(domain: 'example') }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
