class HomeController < ApplicationController
  def index
    @genres = Genre.order(:id)
    @users = []
  end

  def search
    genres_titles = Genre.where(id: params[:genre_ids]).map(&:title)
    users = User.joins(:users_genres).where("users_genres.genre_id IN (?)", params['genre_ids'])    
    @users = users.select {|x| x if (genres_titles - x.genres.map(&:title)).empty? }
  end

  def users
    @users = User.order(email: :asc)
  end

end
