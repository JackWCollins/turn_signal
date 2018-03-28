class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :year
end
