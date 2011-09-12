Bestcup::Application.routes.draw do


  get "totalupdate" => "cupping_total_scores#update", :as => "totalupdate"
  get "totalcreate" => "cupping_total_scores#create", :as => "totalcreate"

  get "dashboard/index"
    
  resources :roasts, :roasteries, :blends, :checks, :beans, :cupping_total_scores, :cupping_overalls, :cupping_clean_cups, :cupping_uniformities, :cupping_sweetnesses, :cupping_balances, :cupping_mouthfeels, :cupping_acidities, :cupping_after_tastes, :cupping_flavors, :cupping_defects, :cupping_break_aromas, :cupping_crust_aromas, :cupping_dry_fragrances, :cuppings
  resources :farms do
    collection do
      get 'select'
    end
  end
  
  root :to => 'dashboard#index'

end