class AddEngagementToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :likes, :int
    add_column :products, :shares, :int
    add_column :products, :comments, :int
    add_column :products, :facebookad_posted_at, :datetime
  end
end
