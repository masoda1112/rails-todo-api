class RemoveIsExpiredToTodos < ActiveRecord::Migration[6.1]
  def change
    remove_column :todos, :is_expired
  end
end
