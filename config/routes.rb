Rails.application.routes.draw do
  resources :users, except: [:index]
  resources :people
   
  root 'users#login'
    
  get 'signup' => "users#new", as: :signup
    
  get 'login' => "users#login", as: :login
    
  post "/login" => "users#authenticate"
    
  delete "logout/:id" => "users#logout", as: :logout
    
  get 'scrape' => "scraper#index", as: :scrape
    
  get 'clear' => "scraper#clear", as: :clear
    
  post "/scrape" => "scraper#scrape"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
