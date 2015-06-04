class Gif < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates_presence_of :creator, :seen_count

  belongs_to :creator, class_name: "User"

  def has_been_seen!
    # seen_count = seen_count + 1
    self.seen_count += 1
    save # self.save
  end
end