require 'rails_helper'
require 'date'

feature "Creating reservation" do

  before(:each) do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save

    login_as(user, :scope => :user)

    room = FactoryBot.create(:room)
    room.name = "1"
    room.save

    @reserv_start_date = DateTime.now
    @reserv_end_date = DateTime.now + 1.hours
  end

  scenario "allows a user to create a reservation" do

    visit root_path

    expect(page).to have_content 'Make Reservation'
    within("form",  visible: false) do
      room_nr = "1"
      select(room_nr, from: 'reservation[choosen_room]', visible: false)
      fill_in 'reservation[start_date]', with: @reserv_start_date
      fill_in 'reservation[end_date]', with: @reserv_end_date
    end
    click_button 'Reserve'
    expect(page).to have_content 'Room was successfully reserved.'
  end
end