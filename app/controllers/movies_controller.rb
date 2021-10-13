class MoviesController < ApplicationController
  before_action :require_user

  def index
    @movies = MovieFacade.movies(params)
  end
end
