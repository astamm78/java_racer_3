class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |r|
      r.integer :player_id, :game_id
    end
  end
end
