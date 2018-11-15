class AddFemaleMaleToProducts < ActiveRecord::Migration[5.2]
  def change
      add_column :products, :facebook_female, :decimal
      add_column :products, :facebook_male, :decimal
  end
end
