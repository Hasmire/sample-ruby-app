Rails.application.routes.draw do
  get "auth/register"
  get "auth/login"
  get "static_pages/home"
  get "static_pages/help"
  get "render/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "dashboard#index"
  get "dashboard/index"

  get "pokemon/new"
  post "pokemon/create"
  get "pokemon/:id/edit", to: "pokemon#edit"
  patch "pokemon/:id", to: "pokemon#update"

  get "/profile", to: "users#show"
  get "/profile/edit", to: "users#edit"
  patch "/profile", to: "users#update"
  get "/profile/edit_credentials", to: "users#edit_credentials"
  patch "/profile/edit_credentials", to: "users#update_credentials"

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/register", to: "users#new"
  post "/register", to: "users#create"
end
