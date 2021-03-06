"
	This is the basic twitter user etc
	We will have concerns / functions that are responsible for updating the elements and then actually grabbing pieces from out twitter code base	
	We will expect that the initialize element will have at least something like this:

		[uid, credentials: {key, secret}]				

	We're going to store the following information

		[profile name, 
			key, secret, uid
			description, 
			profile pic, 
			followers,
			following,
			tweets,
		]
"
class User
	# include our basic mongoid elemental structure
	include Mongoid::Document
	# include our twitter concern etc
	include Concerns::Twitter
	field :created_at, type: DateTime

	# make sure we link a profile!
	has_one :profile

	######## CLASS METHODS #############
	# class method
	def self.omniauth_create(params)

		# return a user based on the id input
		create! do |user|

			user.created_at = DateTime.now.to_s
			user.twitter_init params
			user.profile = Profile.create_profile user.twitter()
			
		end
	end

end
