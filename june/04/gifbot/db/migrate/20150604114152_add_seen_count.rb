class AddSeenCount < ActiveRecord::Migration
  def change
    add_column :gifs, :seen_count, :integer
  end
end
