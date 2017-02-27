class Mentee < ApplicationRecord
  has_many :matches
  has_many :appointments
  belongs_to :user, optional: true

end
