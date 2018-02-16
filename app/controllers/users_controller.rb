class UsersController < ApplicationController
	before_action :required_user, only: [:edit, :update]
	before_action :set_user, except: [:index, :new, :create]

	def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "User details updated"
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:address1, :address2, :city, :state, :pincode, :gstin)
  end
end