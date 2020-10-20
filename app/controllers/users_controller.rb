class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    # store all emails in lowercase and without blank spaces
    @user.email.downcase.strip
    
    if @user.save
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

private

  def user_params
    # strong parameters - whitelist of allowed fields
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end
