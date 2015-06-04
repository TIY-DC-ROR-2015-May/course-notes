class Gif < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates_presence_of :creator, :seen_count

  belongs_to :creator, class_name: "User"

  has_many :gif_tags
  has_many :tags, through: :gif_tags

  def has_been_seen!
    # seen_count = seen_count + 1
    self.seen_count += 1
    save # self.save
  end

  def all_tags
    tags.pluck(:name).join(", ")
  end
end