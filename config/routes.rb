Rails.application.routes.draw do
  root 'quizzes#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  resources :quizzes do
    resources :questions
    post 'check', on: :member, to: 'quizzes#check_quiz', as: :check
  end

  # Health check and PWA routes
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
