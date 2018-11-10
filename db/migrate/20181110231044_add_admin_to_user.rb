class AddAdminToUser < ActiveRecord::Migration[5.2]
  def change
    add_colum :user, :admin, :boolean
  end
end
