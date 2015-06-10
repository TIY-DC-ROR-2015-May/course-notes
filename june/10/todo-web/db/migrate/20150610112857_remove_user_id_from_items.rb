class RemoveUserIdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :user_id, :integer
  end
end
