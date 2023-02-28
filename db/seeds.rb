# frozen_string_literal: true

# require 'csv'

# Создаем админа
# User.create!(email: 'admin@mail.com', password: 'secret', password_confirmation: 'secret')

# Создаем жанры
# scifi = Genre.create(name_en: 'Sci-Fi', name_ru: 'Фантастика')
# horror = Genre.create(name_en: 'Horror', name_ru: 'Ужасы')
# fantasy = Genre.create(name_en: 'Fantasy', name_ru: 'Фэнтези')
# dystopian = Genre.create(name_en: 'Dystopian', name_ru: 'Антиутопия', parent: scifi)

# Создаем несколько книг
# fahrenheit451 = Book.new(
#   title: '451 градус по Фаренгейту',
#   author: 'Рэй Брэдбери',
#   description: 'Роман-антиутопия о тоталитарном обществе будущего, в котором книги запрещены и сжигаются пожарами',
#   rating: 4.2
# )

# it = Book.new(
#   title: 'Оно',
#   author: 'Стивен Кинг',
#   description: 'Роман ужасов о маленьком городке в Нью-Хэмпшире, где появляется зловещий клоун',
#   rating: 4.6
# )

# lotr = Book.new(
#   title: 'Властелин Колец',
#   author: 'Дж. Р. Р. Толкин',
#   description: 'Трилогия фэнтези о сражении добра и зла в Средиземье',
#   rating: 4.9
# )

# Обложки для книг
# file1 = Down.download('https://upload.wikimedia.org/wikipedia/ru/d/d3/451_%D0%B3%D1%80%D0%B0%D0%B4%D1%83%D1%81_%D0%BF%D0%BE_%D0%A4%D0%B0%D1%80%D0%B5%D0%BD%D0%B3%D0%B5%D0%B9%D1%82%D1%83.jpg')
# fahrenheit451.cover.attach(io: file1, filename: 'book1_cover.jpg', content_type: 'image/jpg')
# fahrenheit451.save
#
# file2 = Down.download('https://s1.livelib.ru/boocover/1007351554/o/2490/Stiven_King__Ono.jpeg')
# it.cover.attach(io: file2, filename: 'book2_cover.jpeg', content_type: 'image/jpeg')
# it.save
#
# file3 = Down.download('https://s1.livelib.ru/boocover/1003446750/o/c351/Dzhon_R._R._Tolkin__Vlastelin_kolets_sbornik.jpeg')
# lotr.cover.attach(io: file3, filename: 'book3_cover.jpeg', content_type: 'image/jpg')
# lotr.save

# Создаем связи между книгами и жанрами
# fahrenheit451.genres << scifi
# fahrenheit451.genres << dystopian
#
# it.genres << horror
# lotr.genres << fantasy

# Создаем 100 книг из CSV файла
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'top_100_books.csv'))
# csv = CSV.parse(csv_text, headers: true)
#
# csv&.each do |row|
#   book = Book.new
#   book.title = row['title']
#   book.author= row['author']
#   book.description = row['description']
#
#   url = row['cover_url']
#
#   file = Down.download(url)
#   filename = File.basename(url)
#
#   book.cover.attach(io: file, filename: "#{filename}.jpeg", content_type: 'image/jpeg')
#
#   if book.save
#     puts "#{book.title} - #{book.author} saved"
#   else
#     puts "#{book.title} - #{book.author} failed to save"
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
