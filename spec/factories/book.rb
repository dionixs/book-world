# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    rating { Faker::Number.between(from: 0.0, to: 5.0) }

    after :build do |book|
      book.cover.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'cover.jpg')),
                        filename: 'cover.jpg', content_type: 'image/jpeg')
    end
  end
end
