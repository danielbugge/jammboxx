class CreateLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :levels do |t|
      t.integer :level

      t.timestamps
    end
  end
end
