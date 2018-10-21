class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :img
      t.decimal :buyprice
      t.decimal :sellprice

      t.timestamps 
    end
  end
end
