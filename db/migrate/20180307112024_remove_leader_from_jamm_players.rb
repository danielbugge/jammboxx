class RemoveLeaderFromJammPlayers < ActiveRecord::Migration[5.1]
  def change
    remove_column :jamm_players, :leader, :boolean
  end
end
