class CreateUsers < ActiveRecord::Migration
  def change
    create_table "users" do |t|
      t.string "name"
      t.integer "wins"
      t.integer "losses"
    end
  end
end
