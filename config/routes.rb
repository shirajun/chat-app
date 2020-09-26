Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  # ↑↑ルートパスへのアクセスの場合messages_controllerのindexアクションが呼び出されるようにした
  resources :users, only: [:edit, :update]
end
