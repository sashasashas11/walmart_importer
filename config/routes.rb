Rails.application.routes.draw do
  namespace :api do
    resources :product do
      collection do
        post :import
      end
      member do
        get :filter_by_keyword
      end
    end
  end
end
