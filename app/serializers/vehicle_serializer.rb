class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :description, :year

  has_one :make
  has_one :model
  has_many :options
end
