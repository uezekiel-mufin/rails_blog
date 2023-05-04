require 'faker'

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence(word_count: 5)[0...250] }
    body { Faker::Lorem.paragraph }
    author { User.first || association(:user) }
  end
end
