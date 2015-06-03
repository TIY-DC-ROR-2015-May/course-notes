class User < ActiveRecord::Base
  has_many :games

  validates_presence_of :wins, :losses
  validates_uniqueness_of :name
end