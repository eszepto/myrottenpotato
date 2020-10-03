Myrottenpotatoes::Application.routes.draw do
    resources :movies do
        resources :reviews
    end
    root :to => redirect('/movies')
    get 'search', to: 'tmdb_api#search'
    
    get 'auth/:provider/callback' => 'sessions#create'
    get 'logout' => 'sessions#destroy'
    get 'auth/failure' => 'sessions#failure'
    get 'auth/twitter', as: 'login'
end
