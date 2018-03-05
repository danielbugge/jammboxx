class CreateJammPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :jamm_players do |t|
      t.references :jamm_id, foreign_key: true
      t.references :player_id, foreign_key: true
      t.references :indtrument_id, foreign_key: true

      t.timestamps
    end
  end
end
