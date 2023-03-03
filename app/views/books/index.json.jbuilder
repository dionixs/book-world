# frozen_string_literal: true

json.array!(@books) do |book|
  json.extract! book, :id, :title, :description, :rating, :created_at, :updated_at
  json.associations do
    json.authors book.authors.map { |author| { id: author.id, name: author.name } }
  end
end
