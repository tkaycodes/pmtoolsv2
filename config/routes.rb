Rails.application.routes.draw do

    devise_for :users
    root "projects#index"

    resources :projects   do
    resources :tasks
    resources :categorizations
    resources :likes, only: :create
    end

    #API ROUTES
    #api/v1/projects

    scope :api, defaults: {format: :json} do
      scope :v1 do
        resources :projects, only: [:index, :show]
      end
    end
    
  

end




