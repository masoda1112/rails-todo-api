class ChangeDataIsFinishedToTodos < ActiveRecord::Migration[6.1]
  def change
    change_column :todos, :is_finished, :boolean
  end
end
