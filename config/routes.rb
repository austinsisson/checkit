Rails.application.routes.draw do

  devise_for :users
  
  resources :users, only: [:show, :update] do
    resources :todos
  end
  
  get 'about' => 'welcome#about'
  
  authenticated :user do
    root to: 'users#show', :as => 'authenticated_root'
  end
  
  root to: 'welcome#index'

end
