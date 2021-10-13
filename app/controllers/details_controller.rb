class DetailsController < ApplicationController
  def show
    @movie = MovieFacade.movie_details(params[:movie_id])
  end
end
