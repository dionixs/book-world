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
      Rails.logger.info "#{book.title} saved"
    else
      Rails.logger.error "#{book.title} failed to save"
    end
  end
end
