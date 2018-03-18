require 'rails_helper'

feature 'User Logs in' do
  scenario 'with valid credentials', :reset_warden do

    user = FactoryBot.create(:user)
    user.confirmed_at = Time.now
    user.save

    login_as(user, :scope => :user)

    visit root_path
    expect(page).to have_content("#{user.email}")
  end

  scenario 'cannot access without logging in', js: true do
    visit reservations_user_path

    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end