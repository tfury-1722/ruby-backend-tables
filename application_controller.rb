class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/todo/" do
    todos = Todo.all
    todos.to_json
  end

  get "/todo/:id" do
    todo = Todo.find(params[:id])
    todo.to_json
  end

  get "/categories/" do
    types = Category.all
    types.to_json
  end

  get "/categories/:id" do
    a_type = Category.find(params[:id])
    a_type.to_json
  end

end
