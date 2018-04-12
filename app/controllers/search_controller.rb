class SearchController < ApplicationController
  def index
    if params[:search]
      @search_users = User.where('username LIKE ? ', "%#{params[:search]}%").joins(:moods).select("*").group("users.username").order("users.id ASC")
    else
      @search_users = User.joins(:moods).select("*").group("users.username").order("users.id ASC")
    end
  end
end
