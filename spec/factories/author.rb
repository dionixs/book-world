# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    name { 'John Doe' }
    bio { Faker::Lorem.paragraph }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 90) }
    death_date { Faker::Date.between(from: 1.year.ago, to:  Time.zone.today) }
    place_of_birth { Faker::Address.city }
    place_of_death { Faker::Address.city }
  end
end
