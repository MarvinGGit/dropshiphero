class AddSubscriptionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscriptionid, :string
    add_column :users, :subscribed, :boolean, default: false
    add_column :users, :customerid, :string
  end
end
