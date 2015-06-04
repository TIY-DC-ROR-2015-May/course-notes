class Gif < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true

  belongs_to :creator, class_name: "User"
end