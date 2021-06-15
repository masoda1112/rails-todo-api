class TodosController < ApplicationController
  def get
    render json: Todo.all
    return Todo.all
  end
  # ここは6/16に実験
  def post
    todo = Todo.create(name: params[:name])
    render json: todo
    return todo
  end

  def search
    render json: Todo.where(name: params[:name])
    return Todo.where(name: params[:name])
  end

  # ここは6/16に実験
  def delete
    todo = Todo.find_by(id: params[:id])
    render json: todo
    todo.destroy
    return Todo.all
  end
end
