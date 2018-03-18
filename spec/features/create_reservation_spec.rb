require 'rails_helper'
require 'date'

feature "Creating reservation" do

  before(:all) do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save

    login_as(user, :scope => :user)

    room = FactoryBot.create(:room)
    room.name = "1"
    room.save
  end

  scenario "allows a user to create a reservation" do

    visit root_path

    expect(page).to have_content 'Make Reservation'
    within("form",  visible: false) do
      room_nr = "1"
      select(room_nr, from: 'reservation[choosen_room]', visible: false)
      fill_in 'reservation[start_date]', with: DateTime.now
      fill_in 'reservation[end_date]', with: DateTime.now + 1.hours
    end
    click_button 'Reserve'
    expect(page).to have_content 'Room was successfully reserved.'
  end
end