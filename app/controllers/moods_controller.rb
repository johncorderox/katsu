class MoodsController < ApplicationController
  def index
    @user = current_user
  end

  def create
  end
end
