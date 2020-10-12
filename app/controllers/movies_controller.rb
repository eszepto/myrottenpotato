

class MoviesController < ApplicationController 
    def index
        @movies = Movie.sort_by_title
    end

    def show
        id = params[:id]
        @movie = Movie.find(id)
        if @current_user
            @review = @movie.reviews.find_by(:moviegoer_id => @current_user.id)
        end
        render(:partial => 'movie_popup', :object=>@movie) if request.xhr?
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
    
    def movies_with_good_reviews
        @movies = Movie.joins(:reviews).group(:movie_id).
          having('AVG(reviews.potatoes) > 3')
    end

    def movies_for_kids
        @movies = Movie.where('rating in ?', %w(G PG))
    end

    def movies_with_filters
        @movies = Movie.with_good_reviews(params[:threshold])
        %w(for_kids with_many_fans recently_reviewed).each do |filter|
          @movies = @movies.send(filter) if params[filter]
        end
    end
    
end