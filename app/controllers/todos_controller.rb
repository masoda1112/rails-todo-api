class TodosController < ApplicationController
  def index
    todoList = Todo.all
    render json: todoList
    # todoに紐づくtagもリストアップ
  end
  # ここは6/16に実験
  def create
    render json: Todo.create(name: params[:name])
    # todoに紐づくtagも追加
  end

  def search
    render json: Todo.where(name: params[:name])
    # 部分一致で行けるようにしたい
  end

  # ここは6/16に実験
  def destroy
    todo = Todo.find_by(id: params[:id])
    todo.destroy
    render json: Todo.all
  end
end
