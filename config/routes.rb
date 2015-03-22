Rails.application.routes.draw do
  root   'home#home'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'about'   => 'home#about'
  resources :entries
end
