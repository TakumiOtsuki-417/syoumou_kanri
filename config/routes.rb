Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
    resources :damages,except:[ :index, :show ]
  end
  get "search", to: "items#search"
  get "search_d", to: "items#search_d"
end
