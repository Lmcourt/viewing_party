class FriendshipsController < ApplicationController
  def create
    @friend = User.find_by(email: params[:email])
    if @friend
      validate_friendship
    else
      flash[:alert] = 'Friend not found.'
    end
    redirect_to dashboard_path
  end

  private

  def validate_friendship
    friendship = Friendship.new(user_id: current_user.id, friend_id: @friend.id)
    if friendship.save
      flash[:success] = 'Friend added!'
    else
      flash[:alert] = 'You are already friends!'
    end
  end
end