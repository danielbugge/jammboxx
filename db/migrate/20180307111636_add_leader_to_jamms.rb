class AddLeaderToJamms < ActiveRecord::Migration[5.1]
  def change
    add_reference :jamms, :user, foreign_key: true
  end
end
