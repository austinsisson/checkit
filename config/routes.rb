Rails.application.routes.draw do

  devise_for :users
  resources :lists, only: [:new, :create, :show]
  
  
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end
