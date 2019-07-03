Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/posts/:id/add", to: "posts#add", as: "add"
  patch "/posts/:id/add", to: "posts#add"
  resources :bloggers, :posts, :destinations
end
