class Animal < ApplicationRecord
    has_many :sightings, dependent: :destroy
    validates :animal , presence: true
end
