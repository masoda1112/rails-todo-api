class AddTodoColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :expiration_time ,　:datetime
  end
end
