class CreateJamms < ActiveRecord::Migration[5.1]
  def change
    create_table :jamms do |t|
      t.references :leader_id, foreign_key: true
      t.string :name
      t.text :description
      t.text :address
      t.datetime :date
      t.references :genre_id, foreign_key: true
      t.integer :max_players
      t.boolean :allow_new_instruments
      t.references :level_id, foreign_key: true

      t.timestamps
    end
  end
end
