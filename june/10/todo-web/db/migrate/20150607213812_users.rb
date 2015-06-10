class Users < ActiveRecord::Migration
  def change
  	create_table "users" do |u|
  		u.string "name"
  	end
  end
end
