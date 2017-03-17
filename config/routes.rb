Rails.application.routes.draw do
  root "posts#index"

  get '/about', to: 'static_pages#about'

  devise_for :users

  resources :posts do 
    resources :comments
  end

end
