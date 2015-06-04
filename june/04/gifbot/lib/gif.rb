class Gif < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates_presence_of :creator

  belongs_to :creator, class_name: "User"
end