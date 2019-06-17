Heartlike::Engine.routes.draw do
  devise_for :users, class_name: "Heartlike::User", module: :devise

  namespace :admin do
    resources :resources
    get '', to: 'dashboard#index', as: '/'
  end

  resources :categories
  resources :articles do
    resources :hearts do
      member do
        post :heart
        delete :unheart
      end
    end
  end
  root to: "articles#index"
end
