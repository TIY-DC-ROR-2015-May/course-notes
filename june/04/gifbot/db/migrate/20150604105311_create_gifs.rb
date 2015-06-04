class CreateGifs < ActiveRecord::Migration
  def change
    create_table "gifs" do |t|
      t.string "url"
      t.datetime "created_at"
    end
  end
end
