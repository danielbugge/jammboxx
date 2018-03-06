class Instrument < ApplicationRecord
  belongs_to :user
  belongs_to :instrument_type
end
