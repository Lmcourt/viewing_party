class MovieService
  class << self
    def movies(params)
      if params[:top]
        top_movies
      else
        search_movies(params[:title])
      end
    end

    private

    def top_movies
      MovieClient.fetch('/3/discover/movie?language=en-US&sort_by=vote_average.desc')
    end

    def search_movies(title)
      MovieClient.fetch("/3/search/movie?&query=#{title}&page=1")
    end
  end
end
