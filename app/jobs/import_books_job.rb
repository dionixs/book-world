# frozen_string_literal: true

class ImportBooksJob < ApplicationJob
  queue_as :default

  def perform(filepath)
    Rails.logger.info "Importing books from #{filepath}"

    genres_all = Genre.all.pluck(:name_ru)

    books = []

    CSV.foreach(filepath, headers: true) do |row|
      Rails.logger.info "Processing row #{row}"

      title = row['title']
      authors_names = row['authors']&.split(',')
      genres_names = row['genre']
      cover_url = row['cover_url']
      description = row['description']

      book = Book.new(title:, description:, cover_url:)

      if authors_names.present?
        authors_names.each do |author_name|
          author = Author.find_or_create_by(name: author_name)
          book.authors << author
        end
      end

      if genres_names.present?
        found_genres = genres_all.select { |genre| genres_names.include?(genre) }

        found_genres.each do |genre_name|
          genre = Genre.find_by(name_ru: genre_name)
          book.genres << genre
        end
      end

      books << book

      if books.size >= 3000
        Book.import books, validate: true, recursive: true
        books = []
      end
    end

    Rails.logger.info 'Import complete'
  end
end
