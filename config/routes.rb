Todolist::Application.routes.draw do
  root :to=>"home#index" # / to go to HomeController #index
  resources :buckets, :shallow=>true do 
    resources :items
  end
end
