require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do

  describe "POST #create" do
    context "with valid attributes", :clean_database_with_truncation do
      it "create new reservation" do
        post :create, reservation: attributes_for(build(:reservation))
        expect(Reservation.count).to eq(1)
      end

      it 'redirects to the "index" action for reservation' do
        post :create, reservation: attributes_for(build(:reservation))
        expect(response).to redirect_to Reservation.index
      end

      it 'responds with 201' do
        post :create, reservation: attributes_for(build(:reservation)), format: :json
        expect(response).to have_http_status(201)
      end
    end

    context "with invalid attributes" do
      it "does not create a new reservation" do
        post :create, reservation: attributes_for(build(:reservation, end_date: nil))
          expect(Reservation.count).to eq(0)
      end
    end


  end
end