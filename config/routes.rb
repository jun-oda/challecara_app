Rails.application.routes.draw do
  root 'top_page#index'
  
  devise_for :users
  resources :groups, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    resources :calendars, only: [:index, :new, :create]
  end
  resources :calendars, only: [:edit, :update, :destroy] do
    resources :calendar_messages, only: [:index, :create, :destroy]
  end

  resources :invites, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
