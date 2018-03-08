class JammPlayer < ApplicationRecord
  belongs_to :jamm
  belongs_to :user
  #has_many :instruments
  belongs_to :instrument
  #carlos corrected this code from has_many to belongs_to but may affect instrument creation
end
