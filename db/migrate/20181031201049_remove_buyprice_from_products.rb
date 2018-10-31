class RemoveBuypriceFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :buyprice
  end
end
