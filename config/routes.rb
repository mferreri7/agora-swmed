Rails.application.routes.draw do
  resources :notes
  get '/thankyou', to: "pages#home", as: "home"
  root to: 'notes#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
