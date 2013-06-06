class Item < ActiveRecord::Base

	belongs_to :list
	belongs_to :user
	belongs_to :category

	def deadline
		if self.due.present?
			days = self.due - Date.today 
			days = days.to_i
			if days == 0
				"Today"
			elsif days == 1
				"Tomorrow"
			elsif days > 1
				"Due in #{days} days"
			elsif days < 0
				"#{-days} days past due"
			end
		end
	end
			
			

	# validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

end
