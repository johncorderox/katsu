class MoodsController < ApplicationController
  def index
    @user = current_user
  end

  def create
    @new_mood = Mood.new(mood)
    if @new_mood.save
      redirect_to moods_path
    end
  end

  private

  def mood
    params.require(:mood).permit(:url, :mood, :user_id)
  end
end
