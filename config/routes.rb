Todolist::Application.routes.draw do
  root :to=>"home#index" # / to go to HomeController #index
  resources :buckets
end
