class MovieCollection
  attr_reader :directors_list, :movies

  def initialize(movies)
    @movies = movies
    @directors_list = movies.map(&:director).uniq
  end

  def movie_select(user_index)
    selected_movie =
      @movies.select { |movie| movie.director == @directors_list[user_index - 1] }
             .sample
  end
end
