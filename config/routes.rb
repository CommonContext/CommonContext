Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Test
  resources :mentors #TODO: Determine if we need to limit any of these routes
  resources :mentees, only: [:create, :new, :edit, :show]

  root 'mentors#show'

  get 'auth/:provider/callback', to: 'sessions#create'

  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

end
