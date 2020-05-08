Rails.application.routes.draw do
    root 'welcome#index'
    get '/shelters', to: 'shelters#index'
    get '/shelters/new', to: 'shelters#new'
    get '/shelters/:id', to: 'shelters#show'
    post '/shelters', to: 'shelters#create'
    get '/shelters/:id/edit', to: 'shelters#edit'
    patch '/shelters/:id', to: 'shelters#update'
    delete '/shelters/:id', to: 'shelters#delete'
    get '/pets', to: 'pets#index'
    get '/shelters/:shelter_id/pets', to: 'shelter_pets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
