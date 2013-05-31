class User < ActiveRecord::Base

	has_secure_password
	
	has_many :items
	has_many :collaborators

	validates :name, uniqueness: true
	validates :email, uniqueness: true

end
