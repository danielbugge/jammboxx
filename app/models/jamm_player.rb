class JammPlayer < ApplicationRecord
  belongs_to :jamm
  belongs_to :user
  has_many :instruments
  validates :leader, default: false
end
