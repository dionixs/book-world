# frozen_string_literal: true

class BookImportJob < ApplicationJob
  queue_as :default

  def perform(row)
    book = Book.new
    book.title = row['title']
    book.author_names = row['author']
    book.description = row['description']

    url = row['cover_url']
    book.download_cover(url)

    if book.save
      Rails.logger.info "#{book.title} - #{book.author} saved"
    else
      Rails.logger.error "#{book.title} - #{book.author} failed to save"
    end
  end
end