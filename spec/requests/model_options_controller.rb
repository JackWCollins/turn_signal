require 'rails_helper'

RSpec.describe "model_options", :type => :request do
  let(:model) { create(:model) }
  let(:option) { create(:option) }

  context "#create" do
    context "with valid model_option info" do
      it "creates the model_option" do
        expect(ModelOption.all.count).to eq 0
        post "/model_options", params: {model_option: {model_id: model.id, option_id: option.id}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        json = JSON.parse(response.body)
        model_option = ModelOption.last
        expect(json['id'].to_i).to eq model_option.id
        expect(ModelOption.all.count).to eq 1
        expect(model.reload.options).to eq([option])
      end
    end

    context "with invalid info" do
      it "returns an error if no option is specified" do
        post "/model_options", params: {model_option: {model_id: model.id}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify the option for this model."])
      end

      it "returns an error if no model is specified" do
        post "/model_options", params: {model_option: {option_id: option.id}}, headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 400
        json = JSON.parse(response.body)
        expect(json['errors']).to eq(["Please specify the model for this option."])
      end
    end
  end

  context "#destroy" do
    context "with valid model_option" do
      it "destroys the model_option" do
        model.options << option
        delete "/model_options/#{option.id}?model_id=#{model.id}", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 200
        expect(model.reload.options).to eq([])
      end
    end

    context "with invalid model_option" do
      it "returns a not found error" do
        delete "/model_options/1234?model_id=5678", headers: {"Authorization" => "turnsignal"}
        expect(response.status).to eq 404
      end
    end
  end
end