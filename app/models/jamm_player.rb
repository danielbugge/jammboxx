class JammPlayer < ApplicationRecord
  belongs_to :jamm_id
  belongs_to :user_id
  belongs_to :instrument_id
end
