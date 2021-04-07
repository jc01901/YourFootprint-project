Rails.application.routes.draw do
  get 'profile/profile'
  get 'profile/edit'
  get 'profile/change_password'
  get 'calculator/calculator'
  get 'home/home'
  get 'home/about'
  get 'about', to: 'home#about'
  post 'request_contact', to: 'home#request_contact'
  root 'home#home'
end
