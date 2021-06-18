class AddTagIdToTodoTag < ActiveRecord::Migration[6.1]
  def change
    add_reference :todo_tags, :tags, foreign_key: true
  end
end
