class Item < ActiveRecord::Base

	belongs_to :list
	belongs_to :collaborator
	belongs_to :user
	belongs_to :category

	validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

end
