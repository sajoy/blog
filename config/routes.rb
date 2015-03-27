Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  root :to => 'posts#index'
  resources :users, only: [:index, :show]
  resources :posts do
    resources :comments, :except => [:index, :show]
  end
end
