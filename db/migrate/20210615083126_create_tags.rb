class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.text :name
      t.text :label

      t.timestamps
    end
  end
end
