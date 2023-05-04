require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    photo { Faker::LoremFlickr.image }
    bio { Faker::Lorem.paragraph }
  end
end
