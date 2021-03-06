"
	Session Controller spec
	This test is responsible for creating a temporary oauth user etc and then storing the data etc
	https://github.com/intridea/omniauth/wiki/Integration-Testing
"
require 'spec_helper'

describe SessionsController do

	before :each do			

		# setup the request environment etc
		request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 
	end

	describe "Post sessions#create" do

		it "Should create a user profile!" do	

			post :create, :provider => "twitter"

		end
	end

end
