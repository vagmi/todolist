Todolist::Application.routes.draw do
  devise_for :users

  root :to=>"home#index" # / to go to HomeController #index
  resources :buckets, :shallow=>true do 
    resources :items do
      member do
        post :complete
      end
      collection do
        get :pending
        get :completed
      end
    end
  end
end
