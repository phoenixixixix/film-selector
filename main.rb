require_relative 'lib/movie'
require_relative 'lib/movie_collection'

files_paths = Dir["#{__dir__}/data/*.txt"]

movies =
  files_paths.map do |movie_path|
    lines = File.readlines(movie_path, encoding: 'UTF-8', chomp: true)
    Movie.new(lines[0], lines[1], lines[2])
  end

movie_collection = MovieCollection.new(movies)

# Приветствие
puts "Программа «Фильм на вечер»\n\r"

# Вывод списка режиссеров
movie_collection.directors_list.each.with_index(1) do |director, index|
  puts "#{index}. #{director}"
end

# Проверка ввода пользователя
user_index = 0
until (1..movie_collection.directors_list.count).include?(user_index)
  puts 'Фильм какого режиссера вы хотите сегодня посмотреть?'
  user_index = STDIN.gets.to_i
  puts
end

# Вывод случайного фильма выбранного режиссера
movie = movie_collection.movie_select(user_index)
puts 'И сегодня вечером рекомендую посмотреть:'
puts movie
