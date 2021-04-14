require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { User.create(name: 'user1', email: 'user1@hotmail.com', password: 'password') }
  let(:user2) { User.create(name: 'user2', email: 'user2@hotmail.com', password: 'password') }
  let(:invalid_user) { User.create(name: nil, email: 'user@hotmail.com', password: 'password') }

  describe 'a user can be created' do
    it 'user is valid if it has a name, email, and password' do
      expect(user1).to be_valid
    end

    it 'user is invalid if name, email or password are not present' do
      expect(invalid_user).to_not be_valid
    end
  end

  describe 'a friendship can be created' do
    it 'user can send friend requests' do
      friendship = user1.friendships.new(friend_id: user2.id)
      friendship.save

      expect(user1.pending_friends.size).to eq(1)
    end

    it 'user can accept friend requests' do
      friendship = user1.friendships.new(friend_id: user2.id)
      friendship.save
      user2.confirm_friend(user1)
      friends = user1.friend?(user2)

      expect(friends).to eq(true)
    end

    it 'user can reject friend requests' do
      friendship = user1.friendships.new(friend_id: user2.id)
      friendship.save
      user2.reject_friend(user1)
      friends = user1.friend?(user2)

      expect(friends).to eq(false)
      expect(user1.inverse_friendships.size).to eq(0)
    end
  end
end
