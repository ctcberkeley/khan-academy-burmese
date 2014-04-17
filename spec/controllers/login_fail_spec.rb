require 'spec_helper'

describe "When" do

	before { visit '/login_page' }	
	
	describe "Signing in with facebook" do
		before { OmniAuth.config.mock_auth[:facebook] = :invalid_credentials }
		it "should fail" do
			find('#facebook-login').click
			page.should have_content 'Login credentials are incorrect.'
		end
	end

end