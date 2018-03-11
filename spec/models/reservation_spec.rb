require 'rails_helper'
require 'date'

RSpec.describe Reservation, :type => :model do

  let(:user) { User.new(:email => "asia@test.pl", :password => "secret") }
  let(:room) { Room.new(:name => "1", :capacity => "20") }
  subject { described_class.new(start_date: DateTime.parse("2018-10-03 11:00"),
    end_date: DateTime.parse("2018-10-03 13:00"),
    user: user, room: room) }

  describe "Validations" do
    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "has end date after start date" do
      subject.end_date = subject.start_date - 1.hours
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "belongs to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to room" do
      assc = described_class.reflect_on_association(:room)
      expect(assc.macro).to eq :belongs_to
    end
  end
end