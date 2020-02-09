Rails.application.routes.draw do
  resources :raffles
  resources :pages

   # devise_for :users, controllers: {
   #     sessions: 'users/sessions', registrations: 'users/registrations',
   #      omniauth_callbacks: 'users/omniauth_callbacks'
   # }

     devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
