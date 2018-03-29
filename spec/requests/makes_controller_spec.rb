require 'rails_helper'

RSpec.describe "makes", :type => :request do
  context "#show" do
    context "with valid make ID" do
      it "returns the make ID and name" do
        jeep = create(:jeep)
        get "/makes/#{jeep.id}", headers: {"Authorization" => "turnsignal"}
        json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(json['name']).to eq jeep.name
        expect(json['id']).to eq jeep.id
      end
    end

    context "with invalid make ID" do
      it "returns a 404 not found status" do
        get "/makes/1234", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Sorry, we could not find that Make."])
      end
    end
  end

  context "#index" do
    it "returns all makes" do
      jeep = create(:jeep)
      subaru = Make.create!(name: 'Subaru')
      get "/makes", headers: {"Authorization" => "turnsignal"}
      expect(response.status).to eq 200
      json = JSON.parse(response.body)
      expect(json.size).to eq 2
    end
  end

  context "#create" do
    context "with valid make info" do
      it "creates the make" do
        expect(Make.all.count).to eq 0
        post "/makes", params: {make: {name: "Subaru"}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        json = JSON.parse(response.body)
        expect(json['name']).to eq "Subaru"
        make = Make.last
        expect(json['id'].to_i).to eq make.id
        expect(Make.all.count).to eq 1
      end
    end

    context "with invalid info" do
      it "returns an error if no name is specified" do
        post "/makes", params: {make: {name: ""}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify a name for this make."])
      end

      it "returns an error if a duplicate name is given" do
        jeep = create(:jeep)
        post "/makes", params: {make: {name: jeep.name}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["That already exists as a vehicle 'make'. Please choose a new name."])
      end
    end
  end

  context "#update" do
    context "with valid make info" do
      it "updates the make" do
        jeep = create(:jeep)
        patch "/makes/#{jeep.id}", params: {make: {name: "Jeep!!!!!"}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        expect(jeep.reload.name).to eq "Jeep!!!!!"
      end
    end

    context "with invalide make info" do
      it "returns an error if the name is blank" do
        jeep = create(:jeep)
        patch "/makes/#{jeep.id}", params: {make: {name: ""}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify a name for this make."])
      end

      it "returns an error if the name is a duplicate" do
        jeep = create(:jeep)
        subaru = Make.create!(name: "Subaru")
        patch "/makes/#{jeep.id}", params: {make: {name: subaru.name}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["That already exists as a vehicle 'make'. Please choose a new name."])
      end

      it "returns an error if the make can not be found" do
        patch "/makes/1234", params: {make: {name: "Jeep"}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
      end
    end
  end

  context "#destroy" do
    context "with valid make" do
      it "destroys the make" do
        jeep = create(:jeep)
        delete "/makes/#{jeep.id}", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        expect{jeep.reload}.to raise_error{ActiveRecord::RecordNotFound}
      end
    end

    context "with invalid make" do
      it "returns a not found error" do
        delete "/makes/1234", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
      end
    end
  end
end