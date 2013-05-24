class Collaborator < ActiveRecord::Base

	belongs_to :user
	has_many :items

	validates :nickname, uniqueness: true

end
