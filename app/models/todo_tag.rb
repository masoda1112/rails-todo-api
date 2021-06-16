class TodoTag < ApplicationRecord
  belongs_to :Todo 
  belongs_to :Tag
end
