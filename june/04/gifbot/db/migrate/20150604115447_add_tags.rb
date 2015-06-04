class AddTags < ActiveRecord::Migration
  def change
    create_table "tags" do |t|
      t.string "name"
    end

    create_table "gif_tags" do |t|
      t.integer "tag_id"
      t.integer "gif_id"
    end
  end
end
