class AddTodoIdToTodoTag < ActiveRecord::Migration[6.1]
  def change
    add_reference :todo_tags, :todos, foreign_key: true
  end
end
