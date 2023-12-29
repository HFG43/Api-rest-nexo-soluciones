class Address < ApplicationRecord
  belongs_to :person, foreign_key: 'person_dni', primary_key: 'dni', optional: false

  validates :calle, :ciudad, presence: true
end
