Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Route for Events
  resources :events
  
  get 'repos/:repo_id/events'  =>  'events#repo_events'
  
end
