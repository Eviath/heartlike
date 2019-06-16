Rails.application.routes.draw do
  mount Heartlike::Engine => "/heartlike"
  root to: 'heartlike/articles#index'
end
