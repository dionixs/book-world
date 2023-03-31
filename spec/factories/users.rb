# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { 'Rh5$Qn9NqLqB' }
    password_confirmation { 'Rh5$Qn9NqLqB' }
    tos_agreement { true }
  end
end
