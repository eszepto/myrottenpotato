Myrottenpotatoes::Application.routes.draw do
    resources :movies
    root :to => redirect('/movies')
    get 'search', to: 'tmdb_api#search'
end
