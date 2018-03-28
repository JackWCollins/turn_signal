require 'rails_helper'

RSpec.describe Make, type: :model do
  context "with valid make information" do
    it "saves the make record" do
      tesla = Make.new(name: "Tesla")
      expect(tesla.save).to be true
    end
  end

  context "with invalid make information" do
    it "does not allow duplicate make names" do
      Make.create!(name: "Subaru")
      duplicate = Make.new(name: "Subaru")
      expect(duplicate.save).to be false
      expect(duplicate.errors.messages[:name]).to eq(["That already exists as a vehicle 'make'. Please choose a new name."])
    end

    it "does not save without a name" do
      no_name = Make.new()
      expect(no_name.save).to be false
      expect(no_name.errors.messages[:name]).to eq(["Please specify a name for this make."])
    end
  end
end