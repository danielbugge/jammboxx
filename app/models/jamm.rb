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

  validates :date, presence: :true, uniqueness: { scope: :address, message: "You already created a jamm here at this time!" }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
