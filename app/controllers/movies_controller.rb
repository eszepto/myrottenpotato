class MoviesController < ApplicationController 
    def index
        @movies = Movie.sort_by_title
    end

    def show
        id = params[:id] # retrieve movie ID from URI route
        @movie = Movie.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
    end

    def create
        @movie = Movie.create!(movie_params)
        flash[:notice] = "#{@movie.title} was successfully created."
        redirect_to movie_path(@movie.id)
    end
    
    def edit
        @movie = Movie.find params[:id]
    end

    def update
        @movie = Movie.find params[:id]
        @movie.update_attributes!(movie_params)
        flash[:notice] = "#{@movie.title} was successfully updated."
        redirect_to movie_path(@movie)
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie ’#{@movie.title}’ deleted."
        redirect_to movies_path
    end

    def movie_params
        params.require(:movie).permit(:title, :rating, :release_date, :description)
    end
    
end