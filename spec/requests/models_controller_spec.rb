require 'rails_helper'

RSpec.describe "models", :type => :request do
  let(:jeep) { create(:jeep) }

  context "#show" do
    context "with valid model ID" do
      it "returns the model ID and name" do
        wrangler = create(:wrangler)
        get "/models/#{wrangler.id}", headers: {"Authorization" => "turnsignal"}
        json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(json['name']).to eq wrangler.name
        expect(json['id']).to eq wrangler.id
      end
    end

    context "with invalid model ID" do
      it "returns a 404 not found status" do
        get "/models/1234", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Sorry, we could not find that Model."])
      end
    end
  end

  context "#index" do
    it "returns all models" do
      wrangler = create(:wrangler)
      compass = Model.create!(name: 'Compass', make_id: wrangler.make_id)
      get "/models", headers: {"Authorization" => "turnsignal"}
      expect(response.status).to eq 200
      json = JSON.parse(response.body)
      expect(json.size).to eq 2
    end
  end

  context "#create" do
    context "with valid model info" do
      it "creates the model" do
        expect(Model.all.count).to eq 0
        post "/models", params: {model: {name: "Compass", make_id: jeep.id}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        json = JSON.parse(response.body)
        expect(json['name']).to eq "Compass"
        model = Model.last
        expect(json['id'].to_i).to eq model.id
        expect(Model.all.count).to eq 1
      end
    end

    context "with invalid info" do
      it "returns an error if no name is specified" do
        post "/models", params: {model: {name: "", make_id: jeep.id}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify a name for this model."])
      end

      it "returns an error if no make is specified" do
        post "/models", params: {model: {name: "Compass"}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify a vehicle make."])
      end
    end
  end

  context "#update" do
    context "with valid model info" do
      it "updates the model" do
        wrangler = create(:wrangler)
        patch "/models/#{wrangler.id}", params: {model: {name: "Wrangler!!!!!"}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        expect(wrangler.reload.name).to eq "Wrangler!!!!!"
      end
    end

    context "with invalide model info" do
      it "returns an error if the name is blank" do
        wrangler = create(:wrangler)
        patch "/models/#{wrangler.id}", params: {model: {name: "", make_id: wrangler.make_id}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify a name for this model."])
      end

      it "returns an error if the model can not be found" do
        patch "/models/1234", params: {model: {name: "Compass"}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
      end
    end
  end

  context "#destroy" do
    context "with valid model" do
      it "destroys the model" do
        wrangler = create(:wrangler)
        delete "/models/#{wrangler.id}", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        expect{wrangler.reload}.to raise_error{ActiveRecord::RecordNotFound}
      end
    end

    context "with invalid model" do
      it "returns a not found error" do
        delete "/models/1234", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
      end
    end
  end
end