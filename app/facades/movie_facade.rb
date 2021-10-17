class MovieFacade
  class << self
    def movies(params)
      MovieService.movies(params).map do |movie|
        MoviesPoro.new(movie)
      end
    end

    def movie_details(movie_id)
      data = specific_movie(movie_id).merge(associated_data(movie_id))
      SpecificMoviePoro.new(data)
    end

    private

    def associated_data(movie_id)
      {
        cast: cast_poro_maker(movie_id),
        reviews: review_poro_maker(movie_id),
        recommendations: recommendations_poro_maker(movie_id)
      }
    end

    def cast_poro_maker(movie_id)
      cast(movie_id).map do |person|
        CastPoro.new(person)
      end
    end

    def recommendations_poro_maker(movie_id)
      recommendations(movie_id).map do |rec|
        RecommendationPoro.new(rec)
      end
    end

    def review_poro_maker(movie_id)
      reviews(movie_id).map do |review|
        ReviewPoro.new(review)
      end
    end

    def specific_movie(movie_id)
      MovieService.specific_movie(movie_id)
    end

    def cast(movie_id)
      MovieService.cast(movie_id).take(10)
    end

    def reviews(movie_id)
      MovieService.reviews(movie_id)
    end

    def recommendations(movie_id)
      MovieService.recommendations(movie_id)
    end
  end
end
