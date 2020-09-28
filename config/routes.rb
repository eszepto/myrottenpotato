Myrottenpotatoes::Application.routes.draw do
    resources :movies
    root :to => redirect('/movies')
    get 'seach', to: 'movies#search'
end
