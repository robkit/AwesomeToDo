class List < ActiveRecord::Base

	has_many :items
	has_many :users

	validates :title, uniqueness: true

end
