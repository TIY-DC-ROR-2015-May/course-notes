require 'pry'

require './db/setup'
require './lib/all'

class ToDoList
	attr_reader :user
	def initialize
		puts "Hello! Please log-in by providing your username."
		name = gets.chomp
		@user = User.where(name: name).first_or_create!
		puts "Thank you, #{name}. Select from the following commands."
	end

	def get_command
		puts "'add' to add a new to-do entry to a list"
		puts "'list' to show all incomplete items"
		puts "'list all' to show all to-do items from all lists"
		puts "'next' to show an incomplete item from one of your lists"
		puts "'mark complete' to check off an entry from your to-do list"
		puts "'change due date' on one of your to-do items"
		puts "'search' to look for an entry"
		command = gets.chomp.downcase

		case command
		when "add" 
			create_entry
		when "list"
			view_incomplete_items
		when "list [list_name]"
			view_single_list
		when "list all"
			view_all_items
		when "next"
			next_item
		when "mark complete"
			done?
		when "change due date"
			set_due_date
		when "search"
			search_for_item
		else
			puts "#{@user}I don't know what #{command} means."
		end
	end

	def create_entry
		puts "What list would you like to add an entry to?"
		list_choice = gets.chomp.downcase
		finds_list = List.where(list_name: list_choice).first_or_create!
		puts "Enter a brief description of your to-do item."
		entry = gets.chomp.downcase
		puts "When is this due?"
		initial_due_date = Date.parse(gets.chomp)
		@user.items.create! list_id: finds_list, item_name: entry, due_date: initial_due_date, completed: false
	end

	def view_incomplete_items
		results = @user.items.where(completed: false)
		resulting_list results
	end

	def view_single_list list_name
		puts "List name?"
		list_choice = gets.chomp.downcase
		results = @user.items.where(list_name: list_choice)
		resulting_list results
	end

	def view_all_items
		results = @user.tasks.all
		resulting_list results
	end

	def next_item
		resulting_list = @user.items.where.not(due: nil)
		resulting_list results
	end

	def set_due_date
		view_single_list
		puts "What is the ID of the item that needs to have its due date updated?"
		id_choice = gets.chomp
		puts "And what is the new due date?"
		new_due_date = Date.parse(gets.chomp)
		changing_item = @user.items.find(id_choice.to_i)
		changing_item.due_date = new_due_date
		changing_item.save
	end

	def done?
		puts "What item did you complete?"
		now_done = gets.chomp
		matching_item = @user.items.where("item_name LIKE ?", "%{now_done}")
		matching_item.mark_completed
	end

	def search_for_item
		puts "Enter keyword to search"
		term = gets.chomp
		results = @user.items.where("item_name LIKE ?", "%{term}%")
		resulting_list results
	end

	def resulting_list results
		results.each do |r|
			puts "ID #{r.id} | User ID #{r.user_name} | To-do: #{r.item_name} | On list: #{r.list_name} | Due #{r.due}"
		end
	end

	# def user_login
		
	# end
end

listicize = ToDoList.new
listicize.get_command

