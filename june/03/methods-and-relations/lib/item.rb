class Item < ActiveRecord::Base
  has_many :orders
  #has_many :users, through: :orders
  has_many(:users, {:through => :orders})

  def gross
    (orders.sum(:quantity) * price).to_f
  end

  def users_ordered
    users.count
  end
end