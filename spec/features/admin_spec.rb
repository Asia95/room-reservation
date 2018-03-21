require "rails_helper"

feature "Admin access to app", type: :feature do

  before(:each) do
    admin = FactoryBot.create(:user)
    admin.confirmed_at = Time.now
    admin.admin = true
    admin.save

    login_as(admin, :scope => :user)

    room = FactoryBot.create(:room)
    room.name = "1"
    room.save
  end

  scenario "admin can add reservation" do
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

  scenario "admin can access admin's panel" do

    visit root_path

    #save_and_open_page

    page.find('header', class: "main-header",  visible: false)
      .find('div', class: "navbar-custom-menu",  visible: false)
      .find('ul', class: "nav navbar-nav",  visible: false)
      .find('ul', class: "dropdown-menu",  visible: false)
      .click_link('Admin Panel')

    expect(page).to have_content "Site Administration"
  end
end