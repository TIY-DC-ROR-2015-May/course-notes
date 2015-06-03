class User < ActiveRecord::Base
  validates_presence_of :wins, :losses
  validates_uniqueness_of :name
end