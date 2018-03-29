require 'rails_helper'

RSpec.describe "vehicle_options", :type => :request do
  let(:vehicle) { create(:vehicle) }
  let(:option) { create(:option) }

  context "#create" do
    context "with valid vehicle_option info" do
      it "creates the vehicle_option" do
        expect(VehicleOption.all.count).to eq 0
        post "/vehicle_options", params: {vehicle_option: {vehicle_id: vehicle.id, option_id: option.id}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        json = JSON.parse(response.body)
        vehicle_option = VehicleOption.last
        expect(json['id'].to_i).to eq vehicle_option.id
        expect(VehicleOption.all.count).to eq 1
        expect(vehicle.reload.options).to eq([option])
      end
    end

    context "with invalid info" do
      it "returns an error if no option is specified" do
        post "/vehicle_options", params: {vehicle_option: {vehicle_id: vehicle.id}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify the option for this vehicle."])
      end

      it "returns an error if no vehicle is specified" do
        post "/vehicle_options", params: {vehicle_option: {option_id: option.id}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify the vehicle for this option."])
      end
    end
  end

  context "#destroy" do
    context "with valid vehicle_option" do
      it "destroys the vehicle_option" do
        vehicle.options << option
        delete "/vehicle_options/#{option.id}?vehicle_id=#{vehicle.id}", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        expect(vehicle.reload.options).to eq([])
      end
    end

    context "with invalid vehicle_option" do
      it "returns a not found error" do
        delete "/vehicle_options/1234?vehicle_id=5678", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
      end
    end
  end
end