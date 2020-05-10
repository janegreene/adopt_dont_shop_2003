Rails.application.routes.draw do
    root 'shelters#index'
    get '/shelters', to: 'shelters#index'
    get '/shelters/new', to: 'shelters#new'
    get '/shelters/:id', to: 'shelters#show'
    post '/shelters', to: 'shelters#create'
    get '/shelters/:id/edit', to: 'shelters#edit'
    patch '/shelters/:id', to: 'shelters#update'
    delete '/shelters/:id', to: 'shelters#delete'
    get '/shelters/:id/delete', to: 'shelters#delete'
    get '/pets', to: 'pets#index'
    get '/pets/:id', to: 'pets#show'
    get '/pets/:id/edit', to: 'pets#edit'
    post 'pets/:id/edit', to: 'pets#update'
    delete 'pets/:id', to: 'pets#destroy'
    get '/pets/:id/delete', to: 'pets#delete'
    get '/shelters/:id/pets', to: 'shelter_pets#index'
    get '/shelters/:id/pets/new', to: 'shelter_pets#new'
    post '/shelters/:id/pets', to: 'shelter_pets#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
