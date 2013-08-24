module SessionsHelper
  # xu li dang nhap
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    # cookies is utility supplied by Rails
    self.current_user = user
    # Create current_user, 
    # accessible in both controllers and views, 
    # which will allow constructions such as
    # <%= current_user.name %> and
    # redirect_to current_user
  end
  # kiem tra da dang nhap hay chua
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
  
  def current_user=(user)
    @current_user = user
  end
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  def current_user?(user)
    user == current_user
  end
end
