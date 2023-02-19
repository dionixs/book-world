# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
#
# Never run this in production :)
#
# Создаем жанры
scifi = Genre.create(name_en: 'Sci-Fi', name_ru: 'Фантастика')
horror = Genre.create(name_en: 'Horror', name_ru: 'Ужасы')
fantasy = Genre.create(name_en: 'Fantasy', name_ru: 'Фэнтези')
dystopian = Genre.create(name_en: 'Dystopian', name_ru: 'Антиутопия', parent: scifi)

# Создаем книги
fahrenheit451 = Book.new(
  title: '451 градус по Фаренгейту',
  author: 'Рэй Брэдбери',
  description: 'Роман-антиутопия о тоталитарном обществе будущего, в котором книги запрещены и сжигаются пожарами',
  rating: 4.2
)

it = Book.new(
  title: 'Оно',
  author: 'Стивен Кинг',
  description: 'Роман ужасов о маленьком городке в Нью-Хэмпшире, где появляется зловещий клоун',
  rating: 4.6
)

lotr = Book.new(
  title: 'Властелин колец',
  author: 'Дж. Р. Р. Толкин',
  description: 'Трилогия фэнтези о сражении добра и зла в Средиземье',
  rating: 4.9
)

# Обложки для книг
file1 = Down.download('https://upload.wikimedia.org/wikipedia/ru/d/d3/451_%D0%B3%D1%80%D0%B0%D0%B4%D1%83%D1%81_%D0%BF%D0%BE_%D0%A4%D0%B0%D1%80%D0%B5%D0%BD%D0%B3%D0%B5%D0%B9%D1%82%D1%83.jpg')
fahrenheit451.cover.attach(io: file1, filename: 'book1_cover.jpg', content_type: 'image/jpg')
fahrenheit451.save

file2 = Down.download('https://s1.livelib.ru/boocover/1007351554/o/2490/Stiven_King__Ono.jpeg')
it.cover.attach(io: file2, filename: 'book2_cover.jpeg', content_type: 'image/jpeg')
it.save

file3 = Down.download('https://s1.livelib.ru/boocover/1003446750/o/c351/Dzhon_R._R._Tolkin__Vlastelin_kolets_sbornik.jpeg')
lotr.cover.attach(io: file3, filename: 'book3_cover.jpeg', content_type: 'image/jpg')
lotr.save

# Создаем связи между книгами и жанрами
fahrenheit451.genres << scifi
fahrenheit451.genres << dystopian

it.genres << horror
lotr.genres << fantasy