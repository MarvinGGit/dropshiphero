class AddInstagramadsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :influencer, :text
    add_column :products, :freeplusshipping, :boolean
  end
end
