class AddUserToUserRank < ActiveRecord::Migration
  def change
    add_reference :user_ranks, :user
    add_reference :users, :user_ranks
  end
end