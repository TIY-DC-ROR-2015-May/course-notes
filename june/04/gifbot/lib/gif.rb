class Gif < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
end