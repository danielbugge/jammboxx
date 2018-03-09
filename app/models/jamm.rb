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
end
