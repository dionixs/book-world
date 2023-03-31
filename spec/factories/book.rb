# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    rating { Faker::Number.between(from: 0.0, to: 5.0) }
    # author_names { "#{Faker::Name.name}, #{Faker::Name.name}" }
    description { Faker::Lorem.paragraph }

    after :build do |book|
      book.cover.attach(io: Rails.root.join('spec', 'fixtures', 'cover.jpg').open,
                        filename: 'cover.jpg', content_type: 'image/jpeg')
    end

    after(:build) do |book|
      authors = create_list(:author, 2)
      book.authors << authors
    end
  end
end
