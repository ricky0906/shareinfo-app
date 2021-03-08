Rails.application.routes.draw do
  get 'memos/index'
  root to: "memos#index"
end
