require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  context "with complete vehicle information" do
    it "saves the vehicle record" do
      wrangler = create(:wrangler)
      vehicle = Vehicle.new(year: 2009, make: wrangler.make, model: wrangler, description: "A well used and well loved vehicle")
      expect(vehicle.save).to be true
      expect(vehicle.year).to eq(2009)
      expect(vehicle.description).to eq("A well used and well loved vehicle")
      expect(vehicle.make.name).to eq("Jeep")
      expect(vehicle.model.name).to eq("Wrangler")
    end
  end

  context "with missing or invalid vehicle information" do
    it "does not save without a year" do
      wrangler = create(:wrangler)
      vehicle = Vehicle.new(make: wrangler.make, model: wrangler, description: "A well used and well loved vehicle")
      expect(vehicle.save).to be false
      expect(vehicle.errors.messages[:year]).to eq(["Please include the model year of the vehicle."])
    end

    it "does not save without make or model" do
      wrangler = create(:wrangler)
      vehicle = Vehicle.new(year: 2009, model: wrangler, description: "A well used and well loved vehicle")
      expect(vehicle.save).to be false
      expect(vehicle.errors.messages[:make_id]).to eq(["Please specify the make of the vehicle."])
      vehicle.make = wrangler.make
      vehicle.model_id = nil
      expect(vehicle.save).to be false
      expect(vehicle.errors.messages[:model_id]).to eq(["Please specify the model of the vehicle."])
      vehicle.model = wrangler
      expect(vehicle.save).to be true
    end

    it "does not save if the selected model does not belong to the correct make" do
      jeep = create(:jeep)
      subaru = Make.create!(name: "Subaru")
      outback = subaru.models.create(name: "Outback")
      vehicle = Vehicle.new(year: 2009, make: jeep, model: outback, description: "A Jeep Outback? Weird. Only one ever made.")
      expect(vehicle.save).to be false
      expect(vehicle.errors.messages[:model_id]).to eq(["The Outback model is not manufactured by Jeep. Please choose a valid model for Jeep vehicles."])
    end
  end

  context "with options" do
    it "can add vehicle options" do
      seat_warmers = Option.create(name: "Seat warmers")
      all_wheel_drive = Option.create(name: "All wheel drive")
      vehicle = create(:vehicle)
      vehicle.options << seat_warmers
      expect(vehicle.options).to eq([seat_warmers])
      vehicle.options << all_wheel_drive
      expect(vehicle.options).to eq([seat_warmers, all_wheel_drive])
    end
  end
end