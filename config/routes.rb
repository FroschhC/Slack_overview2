Rails.application.routes.draw do

  root 'questions#index'
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#new'


  resources :questions do
    resources :answers, only: [:index, :show, :create]
  end
end
