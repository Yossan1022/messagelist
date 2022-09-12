Rails.application.routes.draw do
  #「根っこ」に該当するページには、indexのページ
  root to: 'messages#index'
  #7つのルーティングをこの一行で省略
  resources :messages
end
