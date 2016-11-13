class AddGhostToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_ghost_user, :boolean, null: false, default: false
  end
end
