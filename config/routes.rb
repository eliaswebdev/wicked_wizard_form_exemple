Rails.application.routes.draw do
  resources :products


  resources :partners
  resources :partner_steps



  root 'pages#home'
end
