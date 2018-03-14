require 'rails_helper'

RSpec.describe Room, type: :model do
  
  # before(:all) do
  #   @room = create(:room)
  # end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(FactoryBot.build(:room)).to be_valid
    end

    it "is not valid without a name" do
      #room2 = build(:room, name: nil)
      expect(FactoryBot.build(:room, name: nil)).to_not be_valid
    end

    it "is not valid without a capacity" do
      room2 = build(:room, capacity: nil)
      expect(FactoryBot.build(:room, capacity: nil)).to_not be_valid
    end

    it "has a unique name" do
      room2 = create(:room, name: "1")
      expect(FactoryBot.build(:room, name: room2.name)).to_not be_valid
    end
  end
end
