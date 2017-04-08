Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {:registrations => 'users/registrations', :sessions => 'users/sessions'}
  resources :events
  post "user_interests" => "user_interests#create"
  post "user_interests/index" => "user_interests#index"
  post "events/newsfeed" => "events#newsfeed"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
