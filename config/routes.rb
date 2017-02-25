Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :mentors #TODO: Determine if we need to limit any of these routes
  resources :mentees, only: [:create, :new, :edit, :show]

  root 'mentors#show'

end
