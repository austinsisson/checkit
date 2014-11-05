Rails.application.routes.draw do

  resources :lists, only: [:new, :create, :show]
  
  
  root to: 'welcome#index'
end
