Rails.application.routes.draw do

  resources :lists, only: [:new, :create, :show]
  
  
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end
