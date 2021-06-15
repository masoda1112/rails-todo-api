class TodosController < ApplicationController
  def get
    render json: Todo.all
    return Todo.all
  end

  def post
    todo = Todo.create(name: params[:name])
    render json: todo
    return todo
  end

  def search
    render json: Todo.where(name: params[:name])
    return Todo.where(name: params[:name])
  end

  def delete
    todo = Todo.find_by(id: params[:id])
    render json: todo
    todo.destroy
    return Todo.all
  end
end
