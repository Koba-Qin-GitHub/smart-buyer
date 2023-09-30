class UsersController < ApplicationController

  def show
    set_user
    @items = Item.where(user_id: current_user.id)
    @favorites = Favorite.where(user_id: current_user.id)

    # マイページ遷移時に、最新の在庫状況を表示
    Rails.application.load_tasks
    # Rake::Task['api_date_save:Mouser_API_date_save'].execute
    # Rake::Task['api_date_save:Mouser_API_date_save'].clear
    Rake::Task['reminder:reminder_mail'].execute
    Rake::Task['reminder:reminder_mail'].clear

  end


  def edit

  end

  
  def update

    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end

  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    # def set_item
    #   @item = Item.find(params[:id])
    # end

    def user_params
      params.require(:user).permit(:name, :email, :company_id, :birthday)
    end
    


end
