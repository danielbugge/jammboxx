class CreateJammPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :jamm_players do |t|
      t.references :jamm, foreign_key: true
      t.references :user, foreign_key: true
      t.references :instrument, foreign_key: true
      t.boolean :leader

      t.timestamps
    end
  end
end
