class Vehicle < ApplicationRecord
  belongs_to :make
  belongs_to :model
  has_many :vehicle_options, dependent: :destroy
  has_many :options, through: :vehicle_options

  validates_presence_of :year, message: "Please include the model year of the vehicle."
  validates_presence_of :make_id, message: "Please specify the make of the vehicle."
  validates_presence_of :model_id, message: "Please specify the model of the vehicle."
  validate :model_belongs_to_make

  private

  def model_belongs_to_make
    return unless model && make
    if model.make_id != make_id
      errors.add(:model_id, "The #{model.name} model is not manufactured by #{make.name}. Please choose a valid model for #{make.name} vehicles.")
    end
  end
end