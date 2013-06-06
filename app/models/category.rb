class Category < ActiveRecord::Base

	has_many :items

	validates :category, uniqueness: true
	
end
