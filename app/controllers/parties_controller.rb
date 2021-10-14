class PartiesController < ApplicationController
  after_action :add_host, only: :create

  def new
    @party = Party.new
    @movie_info = params[:movie_info]
  end

  def create
    @party = Party.create!(party_params)
    @party.users << find_users(params[:party][:users]) + current_user
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

  def add_host
    @party.invitations.create_host(current_user.id)
  end
end
