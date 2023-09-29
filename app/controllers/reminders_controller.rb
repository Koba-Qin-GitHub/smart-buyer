class RemindersController < ApplicationController
  

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
  
end
