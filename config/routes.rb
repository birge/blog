Rails.application.routes.draw do
  root   'home#home'
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get    'about',  to: 'home#about'
  resources :entries

  get '*a',        to: 'home#wrong_url'
end
