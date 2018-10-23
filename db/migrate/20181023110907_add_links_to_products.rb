class AddLinksToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :videoadurl, :string
    add_column :products, :pictureadurl, :string
  end
end
