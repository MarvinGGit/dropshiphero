class AddAdminToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :user, :admin, :boolean
  end
end
