require 'faker'
FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence(word_count: 5) }
    content { Faker::Lorem.sentence(word_count: 20) }
    slug { Faker::Internet.slug }
  end
end
