Rails.application.routes.draw do

  devise_for :users
  
  resources :users, only: [:show, :update] do
    resources :todos, only: [:new, :create, :show]
  end
  
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end
