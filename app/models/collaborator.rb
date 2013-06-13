class Collaborator < ActiveRecord::Base

	belongs_to :user
	belongs_to :list

	def nickname
		user.nickname
	end

end
