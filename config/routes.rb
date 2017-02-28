Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   #TODO: Determine if we need to limit any of these routes

  resources :mentors, except: [:destroy] do #Potentially we can clean this up so mentors can delete their profile if the need to :(.
    resources :appointments
  end

  resources :mentees, only: [:create, :new, :edit, :update, :show] do
  	get 'get-matches' => 'matches#get_matches', :on => :member
    resources :matches, only: [:create, :show] do
      get 'schedule' => 'appointments#create'
    end
    resources :appointments, only: [:show]
  end


  root 'homes#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'auth/signout', to: 'sessions#destroy'


  get 'finish-registration', to: 'homes#finish_registration'

end
