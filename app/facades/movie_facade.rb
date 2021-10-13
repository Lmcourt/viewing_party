class MovieFacade
  class << self
    def movies(params)
      MovieService.movies(params).map do |movie|
        Movie.new(movie)
      end
    end
  end
end
