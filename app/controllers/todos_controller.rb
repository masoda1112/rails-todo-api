class TodosController < ApplicationController
require 'date'
  def index
		todos = Todo.all
    update_is_expired(todos)
    update_todos = Todo.all.reject {|todo| todo.is_expired}
    response = build_todo_response(update_todos)
    render json: response
  end

  # ここは6/16に実験
  def create
    todo = Todo.create(name: params[:name], expiration_time: params[:expiration_time], is_finished: false)
    tag_id = params[:tags_id]

    tag_id.map do |t|
      TodoTag.create(todo_id: todo.id, tag_id: t)
    end

    response = {
      "id": todo.id,
      "name": todo.name,
      "expiration_time": todo.expiration_time,
      "error_message": todo.errors.full_messages
    }

    render json: response
    # todoに紐づくtagも追加
  end

  def update
    todo = Todo.find_by(id: params[:id])
    todo.update(is_finished: true)
    render json: todo
  end

  def search
    # new_todos = Todo.joins(todo_tags: :tag).select(" todos.id, todos.name, label")
    todos = Todo.where(name: params[:name])
    # new_todos_2 = todos.map do |t|
    #   tags = new_todos.where(id: t.id)
    #   {
    #     "id": t.id,
    #     "name": t.name,
    #     "label": tags.pluck(:label)
    #   }
    # end
    new_todos = build_todo_response(todos)
    render json: new_todos

    # 部分一致で行けるようにしたい
  end

  # ここは6/16に実験
  def destroy
    todo = Todo.find_by(id: params[:id])
    todo.destroy
    render json: Todo.all
  end

  # private以下は外部から呼び出せない
  private
  def update_is_expired(todos)
    just_time = DateTime.new
    todos.map do |t|
      # 仮で入れておく
      #  todo_extension = t.expiration_time - just_time;
       todo_extension = 10
        if todo_extension <= 0 && t.is_finished == false then
         t.is_expired == true
        end
    end
  end

  def build_todo_response(todos)
    new_todos = todos.map do |t|
      labels = t.tags.pluck(:label)
      expiration_message = build_expiration_message(t.expiration_time)
      {
        "id": t.id,
        "name": t.name,
        "label": labels,
        "expiration_message": expiration_message,
        "is_finished": t.is_finished,
      }
    end
  end

  def build_expiration_message(expiration_time)
    just_time = DateTime.new
      # 仮で入れておく
      #  todo_extension = t.expiration_time - just_time;
      todo_extension = 10
    expirationMessage = 
      if todo_extension <= 1 then
        ("まもなくタスクの終了期限です！")
      elsif todo_extension <= 10 then
        ("残り10分です！")
      elsif todo_extension <= 60 then
        ("終了まで１時間を切りました！")
      else
        ("時間はあります！焦らないでやりましょう！")
      end
  end
  
end