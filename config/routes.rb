Rails.application.routes.draw do

  devise_for :users
  resources :todos, only: [:new, :create, :show]
  
  
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end
