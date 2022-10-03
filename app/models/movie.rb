class Movie < ActiveRecord::Base
  def self.with_ratings(ratings_list)
    # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
    #  movies with those ratings
    # if ratings_list is nil, retrieve ALL movies
    if ratings_list.nil? or ratings_list.empty?
      Movie.all
    else
      Movie.where(rating: ratings_list)
    end
  end  

  def self.all_ratings
    ['G','PG','PG-13','R']
  end

  def self.ratings_to_show(ratings)
    if ratings.nil? == true
      return all_ratings
    else
      return ratings.keys
    end
  end

  def self.sort_titles(movies)
    movies.order(title: :asc)
  end

  def self.sort_dates(movies)
    movies.order(release_date: :asc)
  end
end
