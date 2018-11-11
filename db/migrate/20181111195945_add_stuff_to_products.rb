class AddStuffToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :facebook_page_url, :string
    add_column :products, :product_page_url, :string
    add_column :products, :product_rating, :decimal
  end
end
