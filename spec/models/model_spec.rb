require 'rails_helper'

RSpec.describe Model, type: :model do
  context "with valid make information" do
    it "saves the model record" do
      jeep = create(:jeep)
      wrangler = Make.new(name: "Wrangler")
      expect(wrangler.save).to be true
    end
  end

  context "with invalid make information" do
    it "requires a valid make" do
      outback = Model.new(name: "Outback")
      expect(outback.save).to be false
      expect(outback.errors.messages[:make_id]).to eq(["Please specify a vehicle make."])
    end

    it "does not save without a name" do
      no_name = Model.new()
      expect(no_name.save).to be false
      expect(no_name.errors.messages[:name]).to eq(["Please specify a name for this model."])
    end
  end
end