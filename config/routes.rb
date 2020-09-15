Rails.application.routes.draw do
  root to: "reminders#index"
  devise_for :users
  resources :reminders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
