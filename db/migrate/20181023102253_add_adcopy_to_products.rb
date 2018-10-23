class AddAdcopyToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :adcopy, :text
  end
end
