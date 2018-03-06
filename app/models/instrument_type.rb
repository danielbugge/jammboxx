class InstrumentType < ApplicationRecord
  has_many :instruments
  validates :name, presence: :true, uniqueness: :true
end
