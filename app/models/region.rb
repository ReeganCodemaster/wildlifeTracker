class Region < ApplicationRecord
    has_many :sightings, dependent: :destroy
    validates :region, presence: true, length: {minimum: 5}
end
