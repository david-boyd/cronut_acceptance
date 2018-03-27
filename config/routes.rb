Rails.application.routes.draw do
  get 'widget/index'

  # get '/:locale' => 'widget/index'
  #
  scope "(:locale)", locale: /en|nl/ do
    get 'widget/index'
  end

  root 'widget#index'
end
