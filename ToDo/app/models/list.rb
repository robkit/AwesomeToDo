class List < ActiveRecord::Base

	has_many :items

	validates :title, uniqueness: true

end
