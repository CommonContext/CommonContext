class Mentee < ApplicationRecord
  has_many :matches
  has_many :appointments
end
