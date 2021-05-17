Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'users/registrations'
  }

  get '/calculator/create', to: 'calculator#create'
 
  # get 'weather/weather'
  # get 'info/info'
  # get 'home/home'
  # get 'home/about'

  root 'home#home'

  get 'information', to: 'info#info'
  get 'calculator', to: 'calculator#calculator'
  # get 'weather', to: 'weather#weather'
  get 'leaderboard', to: 'leaderboard#leaderboard'
  get 'about', to: 'home#about'
  get 'devise/passwords/edit'
  post 'request_contact', to: 'home#request_contact'
  
  get 'profile', to: 'profile#profile'
  get 'profile/change_password'

  get 'termsandconditions', to: 'home#terms'

end
