Rails.application.routes.draw do
  resources :messages
  root 'top_page#index'
  resources :calendars
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
