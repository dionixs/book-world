# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user do

  end

  factory :book_author do
    book { nil }
    author { nil }
  end

  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
