class Region < ApplicationRecord
    has_many :sightings, dependent: :destroy
end
