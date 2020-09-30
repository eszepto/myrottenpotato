Myrottenpotatoes::Application.routes.draw do
    resources :movies do
        resources :reviews
    end
    root :to => redirect('/movies')
    get 'search', to: 'tmdb_api#search'

    get 'auth/:provider/callback ', to: 'sessions#create'
    post 'logout ', to: 'sessions#destroy'
    get 'auth/failure ', to: 'sessions#failure'
    get 'auth/twitter', as: 'login'
end
