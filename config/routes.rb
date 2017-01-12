Rails.application.routes.draw do



  get 'search', to: 'search#results'

  devise_for :users
  resources :users, :only => [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :companies do
    resources :activities
  end

  root to: "home#index"

  get 'page/about'
  get 'page/contact'

end
