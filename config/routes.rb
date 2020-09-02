Rails.application.routes.draw do
  resources :tdlists
  root 'tdlists#index'

  patch 'tdlists/:id/change_status', to: 'tdlists#change_status', as: :change_status
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
