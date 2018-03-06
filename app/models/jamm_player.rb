class JammPlayer < ApplicationRecord
  belongs_to :jamm
  belongs_to :user
  belongs_to :instrument
end
