require 'spec_helper'

describe "OmniAuth Callbacks Controller" do

  before { visit '/login_page' }

  describe "Home page should have links to sign in with facebook and google" do
    it "should have the link to sign in with facebook" do
      page.should have_selector(:id, 'facebook-login')
    end
    it "should have the link to sign it with google" do
      page.should have_selector(:id, 'google-login')
    end
  end
=begin
  describe "Signing in with facebook" do
    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end
    it "should be successfull" do
      find('#facebook-login').click
      page.should have_content 'Successfully authenticated from Facebook account'
      page.should have_content 'Welcome, kabttest account'
    end
  end

  describe "Signing in with google" do
    before do
      request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    end
    it "should be successfull" do
      find('#google-login').click
      page.should have_content 'Successfully authenticated from Google account'
      page.should have_content 'Welcome, kabttest account'
    end
  end
=end
end
