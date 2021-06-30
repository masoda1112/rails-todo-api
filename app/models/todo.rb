class Todo < ApplicationRecord
  validates :name, {presence: true, uniqueness: true}
  has_many :todo_tags
  has_many :tags, through: :todo_tags
end
