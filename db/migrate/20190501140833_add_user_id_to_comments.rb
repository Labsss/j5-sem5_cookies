class AddUserIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :gossip_id, :integer
  end
end
