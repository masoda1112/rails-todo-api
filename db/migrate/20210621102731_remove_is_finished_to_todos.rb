class RemoveIsFinishedToTodos < ActiveRecord::Migration[6.1]
  def change
    remove_column :todos, :is_finished
  end
end
