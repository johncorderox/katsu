class SearchController < ApplicationController
  def index
    @search_users = User.joins(:moods).select("*").group("users.username")
  end
end
