class AddColumnTodos < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :is_finished, :boolean, default: false, null: false
    add_column :todos, :is_expired, :boolean, default: false, null: false
  end
end
