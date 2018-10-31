class AddInstagramAdcopyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :instagramadcopy, :text
  end
end
