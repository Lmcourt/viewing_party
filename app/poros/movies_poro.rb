class MoviesPoro
  attr_reader :title, :vote_average, :id, :poster

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @poster = poster_path(data[:poster_path])
  end

  private

  def poster_path(url)
    "https://image.tmdb.org/t/p/w500#{url}?api_key=#{ENV['movie_api_key']}"
  end
end
