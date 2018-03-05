class Instrument < ApplicationRecord
  belongs_to :owner_id
  belongs_to :instrument_type_id
end
