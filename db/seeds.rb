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
fahrenheit451 = Book.create(
  title: '451 градус по Фаренгейту',
  author: 'Рэй Брэдбери',
  description: 'Роман-антиутопия о тоталитарном обществе будущего, в котором книги запрещены и сжигаются пожарами',
  rating: 4.2,
  cover: 'default_cover.jpg'
)
it = Book.create(
  title: 'Оно',
  author: 'Стивен Кинг',
  description: 'Роман ужасов о маленьком городке в Нью-Хэмпшире, где появляется зловещий клоун',
  rating: 4.6,
  cover: 'default_cover.jpg'
)
lotr = Book.create(
  title: 'Властелин колец',
  author: 'Дж. Р. Р. Толкин',
  description: 'Трилогия фэнтези о сражении добра и зла в Средиземье',
  rating: 4.9,
  cover: 'default_cover.jpg'
)

# Создаем связи между книгами и жанрами
fahrenheit451.genres << scifi
fahrenheit451.genres << dystopian
it.genres << horror
lotr.genres << fantasy
