Rails.application.routes.draw do
  root 'top_page#index'
  
  
 
  devise_for :users
  resources :calendars do
    resources :calendar_messages, only: [:index, :create, :destroy]
    resources :users, only: [:index, :edit, :update]
    #resources :groups, only: [:new, :create, :edit, :update] # ここで設定する。
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
