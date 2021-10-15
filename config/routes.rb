Rails.application.routes.draw do
  root 'top_page#index'
  resources :calendars
  devise_for :users
  resources :calendar_messages, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
