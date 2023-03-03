# frozen_string_literal: true

FactoryBot.define do
  factory :genre do
    name { Faker::Book.genre }

    factory :parent_genre do
      parent_id { nil }
    end

    factory :subgenre do
      association :parent, factory: :parent_genre
    end
  end
end
