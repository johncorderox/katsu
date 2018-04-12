class SearchController < ApplicationController
  def index
    if params[:search]
      @search_users = User.where('username LIKE ? ', "%#{params[:search]}%").joins(:moods).select("users.id AS users_id, users.username, users.bio, moods.url, moods.mood").group("users.username").order("users.id ASC")
    else
      @search_users = User.joins(:moods).select("*").group("users.username").select("users.id AS users_id, users.username, users.bio, moods.url, moods.mood").order("users.id ASC")
    end
  end
end
