class RemindersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :check_user, only:[:new, :create, :destroy]


  def new
    @reminder = Reminder.new
  end


  def create
    
    @reminder = Reminder.new(reminder_params)
    
    if @reminder.save
      redirect_to "/items/#{@reminder.favorite.item.id}/"
    else
      render :new
    end

  end


  def destroy

    reminder = Reminder.find_by(favorite_id: params[:favorite_id])
    reminder.destroy
    redirect_to request.referer

  end


  private

  
  def reminder_params
    params.require(:reminder).permit(:case_id, :reminder_way_id).merge(favorite_id: params[:favorite_id])
  end


  def check_user
    @user = User.find(Favorite.find(params[:favorite_id]).user.id)

    # 遷移前後のユーザーが「同一」かどうかチェック
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end

  end
  
end
