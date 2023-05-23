Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/campaigns', to: 'campaigns#show_campaigns'
  get '/campaign_redirect/:value', to: 'campaigns#redirect', as: 'campaign_redirect'
end
