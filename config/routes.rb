Rails.application.routes.draw do
  resources :draw_output_groups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'application/index'

  resources :draw_stages
  resources :draw_rule_varieties
  resources :draw_step_varieties
  resources :teams

  resources :groups do  
    member do
      patch :update_teams
    end
  end 

  resources :draw_definitions do  
    member do
      patch :update_sequence
    end
  end
 
  resources :draw_stage_definitions do  
    member do
      patch :update_sequence
    end
  end 
  
  resources :draw_steps do  
    member do
      patch :update_groups
    end
  end 
  
  resources :draw_rules do  
    member do
      patch :update_steps
      patch :update_groups
    end
  end 
 
  resources :draws do  
    member do
      get :performance
      post :next_step
      post :undo_step
    end
  end 

  root 'application#index'
end
