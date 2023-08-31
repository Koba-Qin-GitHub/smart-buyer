class UsersController < ApplicationController

  def show
    set_user
  end

  def edit

  end

  def update

  end


  private

    def set_user
      @user = User.find(params[:id])
    end
    


end
