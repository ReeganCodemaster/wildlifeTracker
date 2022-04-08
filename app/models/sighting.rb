class Sighting < ApplicationRecord
  belongs_to :animal
  belongs_to :region

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :date, presence: true
end
