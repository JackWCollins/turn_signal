class Vehicle < ApplicationRecord
  belongs_to :make, optional: true # Optional so we can specify a better error message below
  belongs_to :model, optional: true
  has_many :vehicle_options, dependent: :destroy
  has_many :options, through: :vehicle_options

  validates_presence_of :year, message: "Please include the model year of the vehicle."
  validates_presence_of :description, message: "Please specify a description for this vehicle."
  validate :has_make
  validate :has_model
  validate :model_belongs_to_make

  private

  def has_make
    unless make
      errors.add(:make_id, "Please specify the make of the vehicle.")
    end
  end

  def has_model
    unless model
      errors.add(:model_id, "Please specify the model of the vehicle.")
    end
  end

  def model_belongs_to_make
    return unless model && make
    if model.make_id != make_id
      errors.add(:model_id, "The #{model.name} model is not manufactured by #{make.name}. Please choose a valid model for #{make.name} vehicles.")
    end
  end
end