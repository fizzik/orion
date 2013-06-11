Orion::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  
  resources :products do
  	collection { post :import }

  end	

  root :to => 'products#index', :as => 'index'

  
end
