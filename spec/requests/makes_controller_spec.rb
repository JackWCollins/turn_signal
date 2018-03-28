require 'rails_helper'

RSpec.describe "makes", :type => :request do
  context "#show" do

    context "with valid make ID" do
      it "returns the make ID and name" do
        jeep = create(:jeep)
        get "/makes/#{jeep.id}"
        json = JSON.parse(response.body)
        expect(json['name']).to eq jeep.name
        expect(json['id']).to eq jeep.id
      end
    end

  end
end