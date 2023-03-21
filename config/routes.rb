Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/update'
  get '/books/:id' => 'books#show'
  delete '/books/:id' => 'books#destroy'

  resources :publishers
  resource :profile

  # resources :publishers do
  #   resources :books

  #   member do
  #     get 'detail'
  #   end

  #   collection do
  #     get 'search'
  #   end
  # end
end
