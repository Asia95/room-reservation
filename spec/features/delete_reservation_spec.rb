require 'rails_helper'
require 'date'

feature "Delete reservation" do

  before(:each) do
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save

    login_as(user, :scope => :user)

    room = FactoryBot.create(:room)
    room.name = "1"
    room.save

    reserv_start_date = DateTime.now + 1.hours
    reserv_end_date = DateTime.now + 2.hours

    @reservation = FactoryBot.create(:reservation)
    @reservation.room = room
    @reservation.user = user
    @reservation.start_date = reserv_start_date
    @reservation.end_date = reserv_end_date
    print "#{@reservation.end_date}"
    @reservation.save
  end

  scenario "allows a user to delete his reservation" do

    visit root_path

    save_and_open_page

    expect(page).to have_content 'Reservations'
    print "#{@reservation.end_date}"
    td = page.find(:css, 'td', text: "#{@reservation.end_date}", visible: false)
    tr = td.find(:xpath, './parent::tr')
    within tr do
      find_link('Delete').click
    end
    
    expect(page).to have_content 'Reservation was successfully destroyed.'
  end
end