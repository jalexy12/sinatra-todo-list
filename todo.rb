require 'sinatra'
require 'pry'
require 'tempfile'
require "sinatra/reloader" 
require "awesome_print"
# enable :sessions
# set :session_secret, 'super secret'


# Task = Struct.new(:description)

# tasks = [ Task.new('do things'), Task.new('do more things') ]


class Task
	attr_accessor :task
	def initialize(task)

		@task = task
		
		@complete = false
	end

	def complete!
		@complete = true
	end



	def completed?
		return @complete

	end
	def name
		return @task
	end




end



todos_list = []

todos_list << Task.new("Buy Milk")
 todos_list << Task.new("Do laundry")
 todos_list << Task.new("Finish todo list")




get "/" do 
	erb :index


end

get "/tasks" do 

	@todos_list = todos_list
	
	erb :tasks

end

get "/reset" do
	@todos_list = todos_list
	redirect to("/tasks")
end

get "/complete/:tasknum" do
	@todos_list = todos_list
	tasknum = params[:tasknum].to_i
	(@todos_list[tasknum]).complete!
	redirect to("/tasks")
end





get "/delete/:tasknum" do
	
	tasknum = params[:tasknum].to_i
	@todos_list = todos_list
	@todos_list.delete_at(tasknum)

	 redirect to("/tasks")
	

end
