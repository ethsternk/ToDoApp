Rails.application.routes.draw do
  get 'todos' => 'todos#index', as: :home
  get 'todos/completed' => 'todos#completed', as: :completed
  get 'todos/unfinished' => 'todos#unfinished', as: :unfinished
  get 'todos/new' => 'todos#new', as: :new
  post 'todos' => 'todos#create'
  delete 'todos/:id' => 'todos#destroy', as: :delete
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
