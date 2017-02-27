Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   #TODO: Determine if we need to limit any of these routes
  resources :mentors do 
    resources :appointments, only: [:show]
  end
  resources :mentees, only: [:create, :new, :edit, :show] do 
  	get 'get-matches' => 'matches#get_matches', :on => :member
    resources :matches, only: [:create, :show] do 
      get 'schedule' => 'appointments#create'
    end
    resources :appointments, only: [:show]
  end
 
  root 'mentors#show'

  
  

end
