Rails.application.routes.draw do
  get 'widget/index'

  root 'welcome#index'

  root 'widget#index'
end
