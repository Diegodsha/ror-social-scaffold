class Friendship < ApplicationRecord
  #after_save :create_opposite, if: :opposite_record_is_nil?

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def create_inverse
    Friendship.create(user: user, friend: friend, confirmed: nil)
  end

  def inverse_record_nil?
    Friendship.where('user_id = ? and friend_id= ? and confirmed = ?', friend, user, nil).first.nil?
  end
end
