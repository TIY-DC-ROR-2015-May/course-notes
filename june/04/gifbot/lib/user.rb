class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :gifs, foreign_key: :creator_id
end