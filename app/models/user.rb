class User < ApplicationRecord
			EMAIL_REGEXP =/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

			validates_presence_of :email, :full_name, :location
			validates_uniqueness_of :email
			validates_format_of :email, with: EMAIL_REGEXP
			has_secure_password

			def self.authenticate(email,password)
					find_by(email: email).
					try(:authenticate,password)
			end

end
