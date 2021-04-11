Rails.application.routes.draw do
  devise_for :users
  get '/profile', to: 'profile#profile'
  get 'profile/edit'
  get 'profile/change_password'
  get '/calculator', to: 'calculator#calculator'
  get 'home/home'
  get 'home/about'
  get 'about', to: 'home#about'
  post 'request_contact', to: 'home#request_contact'
  root 'home#home'

end
