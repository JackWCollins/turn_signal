class VehicleOption < ApplicationRecord
  belongs_to :vehicle, optional: true
  belongs_to :option, optional: true

  validates_presence_of :vehicle_id, message: "Please specify the vehicle for this option."
  validates_presence_of :option_id, message: "Please specify the option for this vehicle."
end