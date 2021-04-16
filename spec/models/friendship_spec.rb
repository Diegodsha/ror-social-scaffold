require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user1) { User.create(name: 'user1', email: 'user1@hotmail.com', password: 'password') }
  let(:user2) { User.create(name: 'user2', email: 'user2@hotmail.com', password: 'password') }
  let(:new_friendship) { Friendship.create(user_id:user1.id, friend_id:user2.id, confirmed:nil) } 
  let(:new_invalid_friendship) { Friendship.create(user_id:user1.id) } 

  describe "Friendships can be created" do
    it "checks if friendship is valid" do
        expect(new_friendship).to  be_valid
        expect(user1.friendships.size).to eq(1)
    end
    
    it "checks if friendship is invalid" do
        expect(new_invalid_friendship.valid?).to  be(false)
    end

    it "checks if user have friends :)" do
        new_friendship.confirmed = true
        new_friendship.save
        expect(user1.friends.size).to eq(1)
    end

    it "checks if user have no friends :(" do
        new_friendship.save
        expect(user1.friends.size).to eq(0)
    end

    it "create 2 rows of friendships" do
        new_friendship.save
        expect(Friendship.all.length).to be(1)
    end
    
  end
  

end