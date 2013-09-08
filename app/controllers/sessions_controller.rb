class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.find_by_email(session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
