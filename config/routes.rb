Rails.application.routes.draw do

  devise_for :users
  resources :rooms do
  resources :reservations
  end

  root to: 'pages#home'


  
end
