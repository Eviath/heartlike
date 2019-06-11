Heartlike::Engine.routes.draw do
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
