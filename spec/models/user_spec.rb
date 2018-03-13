require 'rails_helper'

RSpec.describe User, :type => :model do
  #subject { described_class.new(password: "secret", email: "asia@test.pl") }

  # before(:all) do
  #   @user = create(:user)
  # end

  describe "Validations" do
    

    it "is not valid without a password" do
      #subject.password = nil
      expect(FactoryBot.build(:user, password: nil)).to_not be_valid
    end

    it "is not valid without an email" do
      #subject.email = nil
      #user2 = build(:user, email: nil)
      expect(FactoryBot.build(:user, email: nil)).to_not be_valid
    end

    it "has an unique email" do
      #user2 = FactoryBot.build(:user)
      user2 = FactoryBot.build(:user)
      expect(FactoryBot.build(:user, email: user2.email)).to_not be_valid
    end

    it "is valid with valid attributes" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end

  describe User do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

end