class MovieService
  class << self
    def movies(params)
      if params[:top]
        top_movies
      else
        search_movies(params[:title])
      end
    end

    def specific_movie(movie_id)
      MovieClient.fetch("/3/movie/#{movie_id}?")
    end

    def cast(movie_id)
      MovieClient.fetch("/3/movie/#{movie_id}/credits?")[:cast]
    end

    def reviews(movie_id)
      MovieClient.fetch("/3/movie/#{movie_id}/reviews?")[:results]
    end

    def recommendations(movie_id)
      MovieClient.fetch("/3/movie/#{movie_id}/recommendations?")[:results]
    end

    private

    def top_movies
      page1 = MovieClient.fetch('/3/discover/movie?language=en-US&sort_by=vote_average.desc&page=1&vote_count.gte=1050')
      page2 = MovieClient.fetch('/3/discover/movie?language=en-US&sort_by=vote_average.desc&page=2&vote_count.gte=1050')
      page1[:results] + page2[:results]
    end

    def search_movies(title)
      page1 = MovieClient.fetch("/3/search/movie?&query=#{title}&page=1")
      page2 = MovieClient.fetch("/3/search/movie?&query=#{title}&page=2")
      page1[:results] + page2[:results]
    end
  end
end
