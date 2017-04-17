Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {:registrations => 'users/registrations', :sessions => 'users/sessions'}
  resources :events
  post "user_interests" => "user_interests#create"
  post "user_interests/index" => "user_interests#index"
  post "events/newsfeed" => "events#newsfeed"
  post "user_events" => "user_events#create"
  patch "user_events" => "user_events#update"
  post "user_events/get_status" => "user_events#get_status"
  post "user_events/index" => "user_events#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
