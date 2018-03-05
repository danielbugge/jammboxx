class Instrument < ApplicationRecord
  belongs_to :user_id
  belongs_to :instrument_type_id
end
