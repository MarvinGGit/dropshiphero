class AddSubscriptionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscriptionid, :string
    add_column :users, :subscribed, :boolean
    add_column :users, :customerid, :string
  end
end
