class Appointment < ApplicationRecord
  belongs_to :mentor
  belongs_to :mentee
end
