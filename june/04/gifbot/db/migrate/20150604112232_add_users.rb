class AddUsers < ActiveRecord::Migration
  def change
    add_column :gifs, :creator_id, :integer

    create_table "users" do |t|
      t.string "name"
    end
  end
end
