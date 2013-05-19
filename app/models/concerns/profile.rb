"
	Initialize all basic functionality for the twitter profile elements
	Initialize all fields and require that we are using the twitter elements etc
"
module Concerns::Profile

	extend ActiveSupport::Concern

	included do

	  	# now store our basic elements that we want to have accessible via our api	
	  	# this will be a list of all the follower's were currently working with!
	  	# these are all pointers to 
	  	field :followers, type: Array
	  	field :following, type: Array
	    field :name, type: String
	    field :description, type: String
	    field :profile_url, type: String

	  	# include many tweets 
	  	has_many :tweets

	end

	def get_profile

		# get our twitter client
		twitter = twitter()
		self.followers = twitter.followers
		self.description = twitter.user.description
		self.name = twitter().friends

	end



end