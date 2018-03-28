require 'rails_helper'

RSpec.describe Option, type: :model do
  context "with valid make information" do
    it "saves the option record with a model" do
      all_wheel_drive = Option.new(name: "All wheel drive")
      expect(all_wheel_drive.save).to be true
    end
  end

  context "with invalid make information" do
    it "does not save without a name" do
      no_name = Option.new()
      expect(no_name.save).to be false
      expect(no_name.errors.messages[:name]).to eq(["Please specify a name for this option."])
    end
  end
end