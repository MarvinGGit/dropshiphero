class AddSubscribeduntilToUsers < ActiveRecord::Migration[5.2]
  def change
    add_colum :users, :subscribed_until, :timestamp
  end
end
