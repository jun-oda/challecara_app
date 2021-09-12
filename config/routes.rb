Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  resources :calendars
  resources :rooms, only: [:index, :new, :show, :create] do
    resources :messages, only: [:create]
  end
  root 'top_page#index'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
