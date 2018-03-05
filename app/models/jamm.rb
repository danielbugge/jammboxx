class Jamm < ApplicationRecord
  belongs_to :user_id
  belongs_to :genre_id
  belongs_to :level_id
end
