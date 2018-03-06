class AddTimeToJamm < ActiveRecord::Migration[5.1]
  def change
    add_column :jamms, :time, :integer
  end
end
