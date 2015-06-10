class Items < ActiveRecord::Migration
  def change
  	create_table "items" do |i|
  		i.string "item"
  		i.date "due_date"
  		i.boolean "completed"
  		i.integer "list_id"
  		i.integer "user_id"
  	end
  end
end
