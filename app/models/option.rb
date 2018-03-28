class Option < ApplicationRecord
  belongs_to :model, optional: true
  has_many :vehicle_options, dependent: :destroy
  has_many :vehicles, through: :vehicle_options
  has_many :model_options, dependent: :destroy
  has_many :models, through: :model_options

  validates_presence_of :name, message: "Please specify a name for this option."
end