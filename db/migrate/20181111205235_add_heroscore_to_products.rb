class AddHeroscoreToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :heroscore, :decimal
  end
end
