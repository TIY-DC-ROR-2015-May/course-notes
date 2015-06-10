class Item < ActiveRecord::Base
	belongs_to :list

	def mark_completed
		self.completed = true
		save
	end
end