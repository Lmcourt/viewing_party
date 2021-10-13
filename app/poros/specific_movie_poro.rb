class SpecificMoviePoro
  attr_reader :title, :vote_average, :runtime, :genres, :overview, :cast, :reviews

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = formatted_runtime(data[:runtime].to_i)
    @genres = genre_names(data[:genres])
    @overview = data[:overview]
    @cast = data[:cast]
    @reviews = data[:reviews]
  end

  def formatted_runtime(time)
    hours = time / 60
    minutes = time % 60
    one_or_more = hours > 1 ? 'hours' : 'hour'
    "#{hours} #{one_or_more} #{minutes} minutes"
  end

  def genre_names(all_genres)
    all_genres.map do |genre|
      genre[:name]
    end
  end
end
