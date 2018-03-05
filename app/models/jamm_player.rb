class JammPlayer < ApplicationRecord
  belongs_to :jamm_id
  belongs_to :player_id
  belongs_to :indtrument_id
end
