# frozen_string_literal: true

# require 'csv'

# Создаем админа
# if Rails.env.development?
#   AdminUser.create!(
#     username: 'admin', email: 'admin@mail.com',
#     password: 'topsecret', password_confirmation: 'topsecret'
#   )
# end

# Создаем пользователя
# User.create!(username: 'testuser', email: 'test@mail.com',
#              password: 'topsecret', password_confirmation: 'topsecret',
#              tos_agreement: true)

# Создаем авторов
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'authors.csv'))
# csv = CSV.parse(csv_text, headers: true)
#
# authors = []
#
# csv&.each do |row|
#   full_name = row['full_name']
#   short_name = row['short_name']
#   bio = row['bio']
#   seo_description = row['seo_description']
#
#   birth_date = Date.parse(row['birth_date']) if row['birth_date']
#   death_date = Date.parse(row['death_date']) if row['death_date']
#
#   place_of_birth = row['place_of_birth']
#   photo_url = row['photo_url']
#
#   pseudonyms = row['pseudonyms']&.split(';')
#
#   author = Author.new(full_name:, short_name:, bio:, seo_description:,
#                       birth_date:, death_date:, place_of_birth:, photo_url:)
#
#   if pseudonyms.present?
#     pseudonyms.each do |pseudonym|
#       author_pseudonym = AuthorPseudonym.create(name: pseudonym)
#       author.author_pseudonyms << author_pseudonym
#     end
#   end
#
#   authors << author
#
#   if authors.size >= 3000
#     Author.import authors, validate: true, recursive: true
#     authors = []
#   end
# end

# Создаем книги
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'books.csv'))
# csv = CSV.parse(csv_text, headers: true)
#
# books = []
#
# csv&.each do |row|
#   title = row['title']
#   authors_names = row['authors']&.split(';')
#   genres_names = row['genres']&.split(';')
#   cover_url = row['cover_url']
#   description = row['description']
#
#   book = Book.new(title:, description:, cover_url:)
#
#   if authors_names.present?
#     authors_names.each do |author_name|
#       author = Author.find_or_create_by(short_name: author_name)
#       book.authors << author
#     end
#   end
#
#   if genres_names.present?
#     genres_names.each do |genre_name|
#       genre = Genre.find_by(name_ru: genre_name.strip)
#       book.genres << genre if genre
#     end
#   end
#
#   books << book
#
#   if books.size >= 3000
#     Book.import books, validate: true, recursive: true
#     books = []
#   end
# end

# Создаем по 10 отзывов для каждой книги
# books = Book.all
#
# books.each do |book|
#   title = Faker::Lorem.sentence(word_count: 3)
#   body = Faker::Hipster.paragraph(sentence_count: 16)
#
#   review = book.reviews.create(title:, body:)
#
#   if review.save
#     puts 'Review saved'
#   else
#     puts 'Review failed to save'
#   end
# end

# Set Gravatar Hash
# User.find_each do |u|
#   u.profile.send(:set_gravatar_hash)
# end
