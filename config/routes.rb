Rails.application.routes.draw do
  root to: 'application#index'

  resources :jobs do
    resources :contact_requests, only: :create
  end
end
