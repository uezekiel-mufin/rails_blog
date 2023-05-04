require 'faker'

FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    author { User.first || association(:user) }
    post { Post.first || association(:post) }
  end
end
