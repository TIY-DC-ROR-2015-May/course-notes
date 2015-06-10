class Item < ActiveRecord::Base
	belongs_to :lists

	def mark_completed
		self.completed = true
		save
	end
end