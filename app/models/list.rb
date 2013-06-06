class List < ActiveRecord::Base

	has_many :items
	has_many :collaborators

	validates :title, uniqueness: true

end
