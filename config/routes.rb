Rails.application.routes.draw do
  get 'profile/profile'
  get 'profile/edit'
  get 'profile/change_password'
  get 'calculator/calculator'
  get 'home/home'
  get 'home/about'
  root 'home#home'
end
