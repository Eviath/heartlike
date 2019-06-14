
Heartlike::Engine.routes.draw do
  devise_for :users, class_name: "Heartlike::User", module: :devise
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
