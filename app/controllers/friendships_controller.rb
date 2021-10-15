class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    if friend
      Friendship.create(user_id: current_user.id, friend_id: friend.id)
      flash[:success] = 'Friend added!'
    else
      flash[:alert] = 'Friend not found.'
    end
    redirect_to dashboard_path
  end
end
