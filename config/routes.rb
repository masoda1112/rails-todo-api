Rails.application.routes.draw do
  get 'todos/get' => "todos#get"
  get 'todos/search/:name' => "todos#search"
  post 'todos/post/:name/' => "todos#post"
  post 'todos/delete/:id/' => "todos#delete"

  get 'tags/get/:todo_id' => "tags#get"
  post 'tags/add/:todo_id/:tags_id' => "tags#add"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
