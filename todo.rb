require 'sinatra'
require 'pry'
require 'tempfile'
require "sinatra/reloader" 
enable :sessions
set :session_secret, 'super secret'


# Task = Struct.new(:description)

# tasks = [ Task.new('do things'), Task.new('do more things') ]





todos_list = ["Buy Milk", "Finish todo list", "Do laundry"]


get "/" do 
	erb :index

end

get "/tasks" do 

	@todos_list = todos_list

	erb :tasks

end

get "/reset" do
	todos_list = ["Buy Milk", "Finish todo list", "Do laundry"]
	redirect to("/tasks")
end

get "/complete/:tasknum" do
	tasknum = params[:tasknum].to_i
	todos_list[tasknum].completed
	redirect to("/tasks")
end
def completed(task)
	task = "#{task}: Completed"

end




get "/delete/:tasknum" do
	tasknum = params[:tasknum].to_i

	todos_list.delete_at(tasknum)

	 redirect to("/tasks")
	

end
