class CreateGames < ActiveRecord::Migration
  def change
    create_table "games" do |t|
      t.integer "user_id"
      t.string "word"
      t.boolean "won"
      t.datetime "created_at"
    end
  end
end
