require 'faker'

FactoryBot.define do
  factory :comment do
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
    author { User.first || association(:user) }
  end
end
