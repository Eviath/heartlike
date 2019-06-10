Rails.application.routes.draw do
  mount Heartlike::Engine => "/heartlike"
  devise_for :users
end
