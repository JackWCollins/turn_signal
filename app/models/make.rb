class Make < ApplicationRecord
  has_many :models, dependent: :destroy
  has_many :vehicles, through: :models

  validates_presence_of :name, message: "Please specify a name for this make."
  validates_uniqueness_of :name, message: "That already exists as a vehicle 'make'. Please choose a new name."
end