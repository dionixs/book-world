FactoryBot.define do

  factory :book_author do
    book { nil }
    author { nil }
  end

  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end