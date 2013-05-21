class Game < ActiveRecord::Base
  has_many :rounds
  has_many :players, :through => :rounds

  def save_results!( args = {} )
    winner  = args.fetch(:winner)
    time    = args.fetch(:result_time)
    self.update_attributes(:winner => winner, :finish => time)
  end
  
end
