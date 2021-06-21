class ChangeTodoName < ActiveRecord::Migration[6.1]
  def change
    change_column :todos, :name, :string, unique: true
  end
end
