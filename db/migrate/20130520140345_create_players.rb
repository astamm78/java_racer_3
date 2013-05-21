class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |p|
      p.string :name
    end
    add_index :players, :name, :unique => true
  end
end
