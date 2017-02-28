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


  root 'homes#index'

  get 'auth/:provider/callback', to: 'sessions#create'

  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  
  # delete 'mentors/sign_out', to: 'sessions#destroy', as: 'sign_out_2'
  # delete 'mentees/sign_out', to: 'sessions#destroy', as: 'sign_out_1'
  # delete 'mentors/#{params[:id]}', to: 'sessions#destroy', as: 'sign_out_3'
  # delete 'mentees/#{params[:id]}', to: 'sessions#destroy', as: 'sign_out_4'
  # http://localhost:3000/mentors/10#!

end
