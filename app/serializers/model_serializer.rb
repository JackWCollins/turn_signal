class ModelSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_one :make
  has_many :vehicles
  has_many :options
end
