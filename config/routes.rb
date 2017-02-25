Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :mentor #TODO: Determine if we need to limit any of these routes

  root_to '/' => 'mentor#index'
  
end
