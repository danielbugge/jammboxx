class Jamm < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :jamm_players
  has_many :users, through: :jamm_players
  has_many :instruments, through: :jamm_players

  validates :name, presence: :true
  validates :description, presence: :true
  validates :address, presence: :true
  validates :max_players, presence: :true, numericality: { only_integer: true }
  validates :time, presence: :true, numericality: { only_integer: true }, inclusion: { in: (1..23) }
  validates :date, presence: :true
  validates :level, presence: :true, inclusion: { in: ["Beginner", "Intermediate", "Expert"] }


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?



  def self.jamms_with_spaces_available_for_instrument(instrument)
    Jamm.find_by_sql(["SELECT * FROM jamms WHERE jamms.id IN (
        SELECT jamm_players.jamm_id
        FROM jamm_players
          INNER JOIN instruments ON jamm_players.instrument_id = instruments.id
          INNER JOIN instrument_types ON instruments.instrument_type_id = instrument_types.id
          WHERE jamm_players.user_id is null AND instrument_types.name = ?)", instrument])
  end
end
