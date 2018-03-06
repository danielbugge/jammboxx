class Genre < ApplicationRecord
  has_many :jamms
  validates :name, precence: :true
end
