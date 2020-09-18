class Movie < ActiveRecord::Base
    def self.sort_by_title
        return self.all.order(:title)
    end
end