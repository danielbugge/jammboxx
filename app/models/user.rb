class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :instruments
  has_many :jamm_players
  has_many :jamms

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
