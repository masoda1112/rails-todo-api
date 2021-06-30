class ChangeDataIsExpiredToTodos < ActiveRecord::Migration[6.1]
  def change
    change_column :todos, :is_expired, :boolean
  end
end
