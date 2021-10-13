class MoviesController < ApplicationController
  before_action :require_user

  def index
    @movies = MovieFacade.movies(movie_params)
  end

  private

  def movie_params
    params.permit(:top, :title)
  end
end
