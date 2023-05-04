require 'faker'

FactoryBot.define do
  factory :like do
    author { User.first || association(:user) }
    post { Post.first || association(:post) }
  end
end
