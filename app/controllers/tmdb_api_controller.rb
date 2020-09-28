class TmdbApiController < ApplicationController
    def search
        @query_word = params[:q].to_s
        api_key = ENV['TMDB_API_KEY']
        response = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=%s&language=en-US&query=%s&page=1&include_adult=false" % [api_key, @query_word], headers: { 
            "Accept" => "application/json" 
        })
        json_data = JSON.parse(response.body)
        @movie_result = json_data["results"]
        return render 'tmdb_api/search_result'
    end
end
