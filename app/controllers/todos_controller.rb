class TodosController < ApplicationController
  def index
    new_todos = Todo.joins(todo_tags: :tag).select(" todos.id, todos.name, label")
    todos = Todo.all
    new_todos_2 = todos.map do |t|
      tags = new_todos.where(id: t.id)
      {
        "name": t.name,
        "label": tags.pluck(:label)
      }
    end
    render json: new_todos_2
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
