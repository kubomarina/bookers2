Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :books, only:[:create, :index, :show, :destroy, :update, :edit]
  resources :users, only:[:show, :edit, :update, :index]
  get "home/about" => "homes#about"
end
