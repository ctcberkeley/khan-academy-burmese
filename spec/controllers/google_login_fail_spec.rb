require 'spec_helper'

describe "When" do

	before { visit '/login_page' }	
	
	describe "Signing in with google" do
		before { OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials }
		it "should fail" do
			find('#google-login').click
			page.should have_content 'Login credentials are incorrect.'
		end
	end
end