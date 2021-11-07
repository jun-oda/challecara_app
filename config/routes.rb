Rails.application.routes.draw do
  root 'top_page#index'
  devise_for :users
  resources :calendars do
    resources :calendar_messages, only: [:index, :create, :destroy]
  end
  resources :groups, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
