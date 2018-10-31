class AddFacebookAudiencesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :audiences, :text
  end
end
