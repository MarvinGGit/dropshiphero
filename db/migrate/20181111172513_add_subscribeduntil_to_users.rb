class AddSubscribeduntilToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscribed_until, :datetime
  end
end
