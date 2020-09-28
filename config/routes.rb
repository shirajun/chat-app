Rails.application.routes.draw do
  devise_for :users
  #root to: "messages#index"
  # ↑↑ルートパスへのアクセスの場合messages_controllerのindexアクションが呼び出されるようにした
  root to: "rooms#index"
  resources :users, only: [:edit, :update, :create]
  resources :rooms, only: [:new, :create, :destroy] do
   resources :messages, only: [:index, :create]
   #チャットルームに属しているメッセージという意味
  end
end
