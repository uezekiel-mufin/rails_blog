require 'faker'

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
    author { User.first || association(:user) }
  end
end
