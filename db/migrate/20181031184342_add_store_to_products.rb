class AddStoreToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :storename, :string
    add_column :products, :storeurl, :string
    add_column :products, :storefeedbackscore, :float
    add_column :products, :storeprice, :float
    add_column :products, :storeepacket, :boolean
    add_column :products, :storeepacketprice, :float
  end
end
