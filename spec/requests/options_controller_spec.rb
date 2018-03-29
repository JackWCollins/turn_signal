require 'rails_helper'

RSpec.describe "options", :type => :request do
  context "#show" do
    context "with valid option ID" do
      it "returns the option ID and name" do
        seat_warmers = create(:seat_warmers)
        get "/options/#{seat_warmers.id}", headers: {"Authorization" => "turnsignal"}
        json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(json['name']).to eq seat_warmers.name
        expect(json['id']).to eq seat_warmers.id
      end
    end

    context "with invalid option ID" do
      it "returns a 404 not found status" do
        get "/options/1234", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Sorry, we could not find that Option."])
      end
    end
  end

  context "#index" do
    it "returns all options" do
      seat_warmers = create(:seat_warmers)
      all_wheel_drive = Option.create!(name: "All wheel drive")
      get "/options", headers: {"Authorization" => "turnsignal"}
      expect(response.status).to eq 200
      json = JSON.parse(response.body)
      expect(json.size).to eq 2
    end
  end

  context "#create" do
    context "with valid option info" do
      it "creates the option" do
        expect(Option.all.count).to eq 0
        post "/options", params: {option: {name: "All wheel drive"}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        json = JSON.parse(response.body)
        expect(json['name']).to eq "All wheel drive"
        option = Option.last
        expect(json['id'].to_i).to eq option.id
        expect(Option.all.count).to eq 1
      end
    end

    context "with invalid info" do
      it "returns an error if no name is specified" do
        post "/options", params: {option: {name: ""}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify a name for this option."])
      end
    end
  end

  context "#update" do
    context "with valid option info" do
      it "updates the option" do
        seat_warmers = create(:seat_warmers)
        patch "/options/#{seat_warmers.id}", params: {option: {name: "Seat warmers!!!!!"}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        expect(seat_warmers.reload.name).to eq "Seat warmers!!!!!"
      end
    end

    context "with invalide option info" do
      it "returns an error if the name is blank" do
        seat_warmers = create(:seat_warmers)
        patch "/options/#{seat_warmers.id}", params: {option: {name: ""}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify a name for this option."])
      end

      it "returns an error if the option can not be found" do
        patch "/options/1234", params: {option: {name: "All wheel drive"}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
      end
    end
  end

  context "#destroy" do
    context "with valid option" do
      it "destroys the option" do
        seat_warmers = create(:seat_warmers)
        delete "/options/#{seat_warmers.id}", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        expect{seat_warmers.reload}.to raise_error{ActiveRecord::RecordNotFound}
      end
    end

    context "with invalid option" do
      it "returns a not found error" do
        delete "/options/1234", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
      end
    end
  end
end