class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  def self.gross_from_category cat_name
    gross = 0
    items = Item.where("category LIKE ?", "%"+cat_name+"%")
    items.each do |i|
      gross += i.gross
    end
    return gross
  end
end