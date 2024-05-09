Rails.application.routes.draw do

  # get 'lists/new'
  # post 'lists' => 'lists#create'
  # get 'lists' => 'lists#index'
  # 詳細のページへのルーティングを名前付きルートにする
  # get 'lists/:id' => 'lists#show', as: 'list'
  # :idに数字が入り、詳細のページそれぞれに遷移する
  # get 'lists/:id' => 'lists#show'
  # :idを使用し、すべてのURLが対象になるようにルーティングする
  # get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  # 一部更新やリソース全体を送信するのが難しい場合はpatchを使用する
  # patch 'lists/:id' => 'lists#update', as: 'update_list'
  # 投稿の削除、名前付きパスはdestroy_list
  # delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'

  # topだけ残して他はresourcesメソッドに置き換える
  get '/top' => 'homes#top'
  resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
