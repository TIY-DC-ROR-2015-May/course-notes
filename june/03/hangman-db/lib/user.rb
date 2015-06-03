class User < ActiveRecord::Base
  has_many :games

  validates_presence_of :wins, :losses
  validates_uniqueness_of :name

  def last_game
    games.order(created_at: :desc).first
  end

  def losses_since_dawn_of_time
    losses
  end

  def losses_since_we_started_tracking_games
    game.where(won: false).count
  end
end