require 'rails_helper'

RSpec.describe "vehicles", :type => :request do
  let(:jeep) { create(:jeep) }

  context "#show" do
    context "with valid vehicle ID" do
      it "returns the vehicle ID and description" do
        vehicle = create(:vehicle)
        get "/vehicles/#{vehicle.id}", headers: {"Authorization" => "turnsignal"}
        json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(json['description']).to eq vehicle.description
        expect(json['year']).to eq vehicle.year
        expect(json['id']).to eq vehicle.id
      end
    end

    context "with invalid vehicle ID" do
      it "returns a 404 not found status" do
        get "/vehicles/1234", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Sorry, we could not find that Vehicle."])
      end
    end
  end

  context "#index" do
    it "returns all vehicles" do
      vehicle = create(:vehicle)
      oldsmobile = Make.create!(name: "Oldsmobile")
      cutlass = Model.create!(name: "Cutlass", make_id: oldsmobile.id)
      oldsmobile_vehicle = Vehicle.create!(year: 1989, description: "My first car", make_id: oldsmobile.id, model_id: cutlass.id)
      get "/vehicles", headers: {"Authorization" => "turnsignal"}
      expect(response.status).to eq 200
      json = JSON.parse(response.body)
      expect(json.size).to eq 2
    end
  end

  context "#create" do
    context "with valid vehicle info" do
      it "creates the vehicle" do
        wrangler = create(:wrangler)
        expect(Vehicle.all.count).to eq 0
        post "/vehicles", params: {vehicle: {year: 1989, description: "New Vehicle", make_id: wrangler.make_id, model_id: wrangler.id}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        json = JSON.parse(response.body)
        expect(json['description']).to eq "New Vehicle"
        vehicle = Vehicle.last
        expect(json['id'].to_i).to eq vehicle.id
        expect(Vehicle.all.count).to eq 1
      end
    end

    context "with invalid info" do
      it "returns an error if no description is specified" do
        wrangler = create(:wrangler)
        post "/vehicles", params: {vehicle: {year: 1989, description: "", make_id: wrangler.make_id, model_id: wrangler.id}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify a description for this vehicle."])
      end

      it "returns an error if no make is specified" do
        wrangler = create(:wrangler)
        post "/vehicles", params: {vehicle: {year: 1989, description: "Great car", model_id: wrangler.id}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify the make of the vehicle."])
      end
    end
  end

  context "#update" do
    context "with valid vehicle info" do
      it "updates the vehicle" do
        vehicle = create(:vehicle)
        patch "/vehicles/#{vehicle.id}", params: {vehicle: {description: "This is super awesome!!!"}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        expect(vehicle.reload.description).to eq "This is super awesome!!!"
      end
    end

    context "with invalide vehicle info" do
      it "returns an error if the description is blank" do
        vehicle = create(:vehicle)
        patch "/vehicles/#{vehicle.id}", params: {vehicle: {description: ""}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify a description for this vehicle."])
      end

      it "returns an error if the vehicle can not be found" do
        patch "/vehicles/1234", params: {vehicle: {description: "Things"}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
      end
    end
  end

  context "#destroy" do
    context "with valid vehicle" do
      it "destroys the vehicle" do
        vehicle = create(:vehicle)
        delete "/vehicles/#{vehicle.id}", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        expect{vehicle.reload}.to raise_error{ActiveRecord::RecordNotFound}
      end
    end

    context "with invalid vehicle" do
      it "returns a not found error" do
        delete "/vehicles/1234", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
      end
    end
  end
end