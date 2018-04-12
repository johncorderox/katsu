class MoodsController < ApplicationController
  def index
    @user = current_user
    @mood = User.joins(:moods).select("users.id AS users_id, username, moods.id AS moods_id, moods.mood, moods.created_at, url").order('moods_id DESC')
    @happiness = Mood.where(mood: "happy").count
    @sadness = Mood.where(mood: "sad").count
    @anger = Mood.where(mood: "anger").count
    @fear = Mood.where(mood: "fear").count
  end

  def create
    @new_mood = Mood.new(mood)
    if @new_mood.save
      redirect_to moods_path
    end
  end

  def destroy
  Mood.find(params[:id]).delete
  redirect_to moods_path
  end

  private

  def mood
    params.require(:mood).permit(:url, :mood, :user_id)
  end
end
