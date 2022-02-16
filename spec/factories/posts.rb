FactoryBot.define do
  factory :post, class: 'Post' do
    title { Faker::Lorem.sentence(word_count: 5) }
    content { Faker::Lorem.paragraph_by_chars(number: 256) }
    user
  end
end
