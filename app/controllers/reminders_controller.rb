class RemindersController < ApplicationController
  
  def new
    # binding.pry
    @reminder = Reminder.new
  end

  def create
    # binding.pry
    
    @reminder = Reminder.new(reminder_params)

    @reminder.save
    ReminderWayMailer.report(@reminder).deliver_now

    redirect_to user_path(current_user.id)
    

  end

  def destroy
    # binding.pry

    reminder = Reminder.find_by(favorite_id: params[:favorite_id])
    reminder.destroy
    redirect_to request.referer,  notice: 'お気に入り登録を解除しました！'

  end


  private

  def reminder_params
    params.require(:reminder).permit(:case_id, :reminder_way_id).merge(favorite_id: params[:favorite_id])
  end
end
