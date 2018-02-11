class UsersController < ApplicationController
	before_action :required_user, only: [:edit, :update]
	before_action :set_user, except: [:index, :new, :create]

	def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Username details updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end