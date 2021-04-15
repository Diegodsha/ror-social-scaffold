require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user1) { User.create(name: 'user1', email: 'user1@hotmail.com', password: 'password') }
  let(:user2) { User.create(name: 'user2', email: 'user2@hotmail.com', password: 'password') }
  let(:post) {   user1.posts.create(content:"test post") } 
    describe "a post can be liked by a user" do

        it "if there's a post a user can like it" do

            user2.likes.create(post_id:post.id)


            expect(post.likes.size).to  eq(1)
        end

        it "if a user likes a post user can unlike it" do

            user2.likes.create(post_id:post.id)
            like = Like.find_by(id: 1, user: user2, post_id:post.id)
            like.destroy

            expect(post.likes.size).to  eq(0)
        end

        it "if there's a post multiple users can like it" do
        
            user1.likes.create(post_id:post.id)
            user2.likes.create(post_id:post.id)

            expect(post.likes.size).to  eq(2)
        end
    end
end