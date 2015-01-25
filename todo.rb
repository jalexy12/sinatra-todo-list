require 'sinatra'
require 'pry'
require 'tempfile'
require "sinatra/reloader" 
require "awesome_print"
enable :sessions
set :session_secret, 'super secret'


# Task = Struct.new(:description)

# tasks = [ Task.new('do things'), Task.new('do more things') ]


class Task
	def initialize(task)
		@task = task
	end

	def completed(task)
		@task = "#{@task}: Completed"

	end



end



todos_list = []
todos_list << Task.new("Buy Milk")
todos_list << Task.new("Do laundry")
todos_list << Task.new("Finish todo list")
# todos_list.add("Buy Milk")
# todos_list.add("Finish todo list")
# todos_list.add("Do Laundry")
# (["Buy Milk", "Finish todo list", "Do laundry"])
# todos_list << Task.new("Buy Milk")
# todos_list << Task.new("Finish todo list")
# todos_list << Task.new("Do laundry")


get "/" do 
	erb :index

end

get "/tasks" do 

	@todos_list = todos_list
	ap @todos_list
	erb :tasks

end

get "/reset" do
	@todos_list = todos_list
	redirect to("/tasks")
end

get "/complete/:tasknum" do
	tasknum = params[:tasknum].to_i
	completed(todos_list[tasknum])
	redirect to("/tasks")
end





get "/delete/:tasknum" do
	tasknum = params[:tasknum].to_i

	todos_list.delete_at(tasknum)

	 redirect to("/tasks")
	

end
