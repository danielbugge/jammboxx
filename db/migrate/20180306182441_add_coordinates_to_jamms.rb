class AddCoordinatesToJamms < ActiveRecord::Migration[5.1]
  def change
    add_column :jamms, :latitude, :float
    add_column :jamms, :longitude, :float
  end
end
