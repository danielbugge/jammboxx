class Genre < ApplicationRecord
  has_many :jamms
  validates :name, presence: :true
end
