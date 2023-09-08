class UsersController < ApplicationController

  def show
    set_user
    @items = Item.all
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
