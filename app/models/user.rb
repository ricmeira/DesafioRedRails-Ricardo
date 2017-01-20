class User < ApplicationRecord
		EMAIL_REGEXP =/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

		# follower_follows "names" the Follow join table for accessing through the follower association
		has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow" 
		# source: :follower matches with the belong_to :follower identification in the Follow model 
		has_many :followers, through: :follower_follows, source: :follower

		# followee_follows "names" the Follow join table for accessing through the followee association
		has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"    
		# source: :followee matches with the belong_to :followee identification in the Follow model   
	 	has_many :followees, through: :followee_follows, source: :followee

		has_many :tweets
			validates_presence_of :email, :full_name, :location
			validates_uniqueness_of :email
			validates_format_of :email, with: EMAIL_REGEXP
			has_secure_password

			def self.authenticate(email,password)
					find_by(email: email).
					try(:authenticate,password)
			end

end
