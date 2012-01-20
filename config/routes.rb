Bestcup::Application.routes.draw do
  
  resources :producer_admins

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get "totalupdate" => "cupping_total_scores#update", :as => "totalupdate"
  get "totalcreate" => "cupping_total_scores#create", :as => "totalcreate"
  get "dashboard/index"
  get "about" => "dashboard#about", :as => "about"
  
  resources :users, :sessions, :blends, :checks, :farms, :beans, :cupping_total_scores, :cupping_overalls, :cupping_clean_cups, :cupping_uniformities, :cupping_sweetnesses, :cupping_balances, :cupping_mouthfeels, :cupping_acidities, :cupping_after_tastes, :cupping_flavors, :cupping_defects, :cupping_break_aromas, :cupping_crust_aromas, :cupping_dry_fragrances, :cuppings, :roasts, :roasters, :batches, :roastery_admins, :roasteries
  
  root :to => 'dashboard#index'

end