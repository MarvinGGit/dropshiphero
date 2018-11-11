class AddOthersToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :facebookad_url, :string
    add_column :products, :review_csv_url, :string
  end
end
