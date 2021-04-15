require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user1) { User.create(name: 'user1', email: 'user1@hotmail.com', password: 'password') }
  let(:user2) { User.create(name: 'user2', email: 'user2@hotmail.com', password: 'password') }
  let(:post) {   user1.posts.create(content:"test post") } 
  let(:comment1) { Comment.create(content:"test comment") } 
  let(:comment2) { Comment.create(content:"test comment") } 

    describe "a post can have comments" do

        it "user can create a comment on posts" do

            comment1.post_id = post.id
            comment1.user = user2
            comment1.save

            expect(post.comments.size).to eq(1)
        end

        it "user can create more than one comment on posts" do

            comment1.post_id = post.id
            comment1.user = user2
            comment1.save

            comment2.post_id = post.id
            comment2.user = user2
            comment2.save
            
            expect(post.comments.size).to eq(2)
        end
    end
end