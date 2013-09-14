module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    @current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  # def current_user=(user)
  #   @current_user = user
  # end

  def signed_in_user
    if signed_in? == false
      store_location
      flash[:notice] = "Please sign in."
      redirect_to signin_url# unless signed_in?
    end
  end


  def current_user
    user = User.find_by_remember_token(cookies[:remember_token]) if cookies[:remember_token]
    @current_user ||= user
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
