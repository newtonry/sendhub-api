SendHubChallenge::Application.routes.draw do
  resources :messages, only: :create
  resources :static_pages, only: :index
  root "static_pages#index"
end
