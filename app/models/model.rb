class Model < ApplicationRecord
  belongs_to :make, optional: true # Marked as optional here so we can use a better error message in presence check below
  has_many :vehicles, dependent: :destroy
  has_many :model_options, dependent: :destroy
  has_many :options, through: :model_options

  validates_presence_of :name, message: "Please specify a name for this model."
  validates_presence_of :make_id, message: "Please specify a vehicle make."
end