class RemindersController < ApplicationController
  
  def new
    # binding.pry
    @reminder = Reminder.new
  end

  def create
    # binding.pry
    
    @reminder = Reminder.new(reminder_params)
    
    @reminder.save

    redirect_to root_path
    

  end


  private

  def reminder_params
    params.require(:reminder).permit(:case_id, :reminder_way_id).merge(favorite_id: params[:favorite_id])
  end
end
