class ModelOption < ApplicationRecord
  belongs_to :model, optional: true
  belongs_to :option, optional: true

  validates_presence_of :model_id, message: "Please specify the model for this option."
  validates_presence_of :option_id, message: "Please specify the option for this model."
end