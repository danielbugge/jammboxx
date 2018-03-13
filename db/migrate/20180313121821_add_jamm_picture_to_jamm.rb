class AddJammPictureToJamm < ActiveRecord::Migration[5.1]
  def change
    add_column :jamms, :jamm_picture, :string
  end
end
