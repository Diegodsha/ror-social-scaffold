class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friend_id: params[:user_id])

    if @friendship.save
      redirect_to users_path, notice: 'You invited a friend!'
    else
      redirect_to users_path, alert: 'You cannot invite this friend.'
    end
  end

  def update
    #@friendship = Friendship.find(params[:friendship_id])
    friend = User.find(params[:user_id])
    current_user.confirm_friend(friend)

    redirect_to user_path, notice: "#{friend.name} is now your friend"
    
  end
  
end
