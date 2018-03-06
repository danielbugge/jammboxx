class CreateJamms < ActiveRecord::Migration[5.1]
  def change
    create_table :jamms do |t|
      t.string :name
      t.text :description
      t.text :address
      t.date :date
      t.time :time
      t.integer :duration
      t.references :genre, foreign_key: true
      t.integer :max_players
      t.string :level
      t.boolean :allow_new_instrument
      t.string :photo

      t.timestamps
    end
  end
end
