# frozen_string_literal: true

json.extract! @book, :id, :title, :description, :rating, :created_at, :updated_at

json.authors @book.authors.map { |author| { name: author.name } }

json.reviews @book.reviews do |review|
  json.extract! review, :id, :title, :body, :created_at, :updated_at
end
