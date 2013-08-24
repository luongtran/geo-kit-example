class SessionsController < ApplicationController

  def new
  end

  def create
    # lay thong tin user duoc submit
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # chung thuc thanh cong
      sign_in user # ghi vao cookies
      redirect_to user
      flash[:notice] = "Welcome back !"
      # Sign the user in and redirect to the user's show page.
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
