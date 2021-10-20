class SpecificMoviePoro
  attr_reader :id, :title, :vote_average, :runtime, :genres, :overview, :cast, :reviews, :recommendations, :poster

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime].to_i
    @genres = genre_names(data[:genres])
    @overview = data[:overview]
    @cast = data[:cast]
    @reviews = data[:reviews]
    @recommendations = data[:recommendations]
    @poster = poster_path(data[:poster_path])
  end

  def formatted_runtime
    hours = @runtime / 60
    minutes = @runtime % 60
    one_or_more = hours > 1 ? 'hours' : 'hour'
    "#{hours} #{one_or_more} #{minutes} minutes"
  end

  private

  def genre_names(all_genres)
    all_genres.map do |genre|
      genre[:name]
    end
  end

  def poster_path(url)
    "https://image.tmdb.org/t/p/w500#{url}?api_key=#{ENV['movie_api_key']}"
  end
end
