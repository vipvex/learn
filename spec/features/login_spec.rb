require "rails_helper"

RSpec.feature "Login", :type => :feature do
  let(:user) { create :user }
  
  scenario "User logs in" do
    
    visit "/users/sign_in"

    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    click_button "Log in"

    expect(page).to have_text("Signed in successfully.")
  end
end