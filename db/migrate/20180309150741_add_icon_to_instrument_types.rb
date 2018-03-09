class AddIconToInstrumentTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :instrument_types, :icon_url, :string
  end
end
