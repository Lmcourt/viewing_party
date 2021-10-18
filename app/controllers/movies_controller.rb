class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.movies(movie_params)
  end

  private

  def movie_params
    params.permit(:top, :title)
  end
end
