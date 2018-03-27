class Make < ApplicationRecord
  has_many :models
  has_many :vehicles, through: :models
end