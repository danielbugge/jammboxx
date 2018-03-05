class Jamm < ApplicationRecord
  belongs_to :leader_id
  belongs_to :genre_id
  belongs_to :level_id
end
