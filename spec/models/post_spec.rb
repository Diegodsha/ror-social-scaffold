require 'rails_helper'

RSpec.describe Post, type: :model do
    
  let(:user1) { User.create(name: 'user1', email: 'user1@hotmail.com', password: 'password') }
  let(:user2) { User.create(name: 'user2', email: 'user2@hotmail.com', password: 'password') }
  let(:post) {   user1.posts.create(content:"test post") } 

    describe "a post can be created" do
        it "user can create posts" do
            expect(post).to  be_valid
        end
    end
end