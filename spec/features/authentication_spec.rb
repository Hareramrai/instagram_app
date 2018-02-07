require 'rails_helper'

RSpec.describe "Authentication", type: :feature do
  
  it "don't allow to access authenticated page without login" do
    visit images_url
    expect(current_url).to eq(new_user_session_url)
    expect(page).to have_selector("div.alert", text: "Not Allowed! Please sign in using Instagram authentication.")
  end

  it "allow to access authenticated page after login and have images from instagram" do
    stub_recent_media
    user = create(:user)
    login_as(user, :scope => :user)
    visit images_url
    expect(current_url).to eq(current_url)
    expect(page).to have_selector("div.instagram-caption", text: "This is test caption")
    expect(page).to have_selector('a.thumbnail', count: 3)
  end
  
  it 'allows users to log in' do
    mock_omniauth uid: 112234, username: "harerrai" 
    visit root_url 
    click_link "Sign in", visible: false  
    expect(page).to have_selector("div.profile_picture.pull-right", text: "harerrai")
  end

  it 'allows users to log out' do
    user = create(:user)
    login_as(user, :scope => :user)
    visit root_url
    click_link "Sign out", visible: false 
    expect(current_url).to eq(root_url)
    expect(page).to have_selector('div.alert', text: "Signed out successfully.")
  end


end