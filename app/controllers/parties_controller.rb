class PartiesController < ApplicationController

  def new
    @party = Party.new
    @movie_info = params[:movie_info]
  end

  def create
    party = Party.create!(party_params)
    party.users << find_users(params[:party][:users])
    flash[:success] = 'Party created!'
    redirect_to dashboard_path
  end

  private

  def party_params
    params.require(:party).permit(:movie_title, :movie_id, :duration, :date, :start_time)
  end

  def find_users(ids)
    User.find(ids[1..])
  end
end
