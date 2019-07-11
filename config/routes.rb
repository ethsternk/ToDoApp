Rails.application.routes.draw do
  resources :todos
  get 'todos#completed' => 'todos#completed', as: :completed
  get 'todos#unfinished' => 'todos#unfinished', as: :unfinished
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
