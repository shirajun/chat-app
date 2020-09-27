Rails.application.routes.draw do
  devise_for :users
  #root to: "messages#index"
  # ↑↑ルートパスへのアクセスの場合messages_controllerのindexアクションが呼び出されるようにした
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
end
