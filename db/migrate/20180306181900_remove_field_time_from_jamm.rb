class RemoveFieldTimeFromJamm < ActiveRecord::Migration[5.1]
  def change
    remove_column :jamms, :time, :time
  end
end
