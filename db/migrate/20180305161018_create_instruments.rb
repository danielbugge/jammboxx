class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :instruments do |t|
      t.references :owner_id, foreign_key: true
      t.references :instrument_type_id, foreign_key: true

      t.timestamps
    end
  end
end
