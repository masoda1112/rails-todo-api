class AddTodoColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :is_finished ,　:boolean
    add_column :todos, :is_expired ,　:boolean
    add_column :todos, :expiration_time ,　:datetime
  end
end
