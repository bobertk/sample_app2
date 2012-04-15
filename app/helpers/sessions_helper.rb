module SessionsHelper
	# use Rails cookie utility (hash: value/expires)
	# current_user is accessible to controllers and views
	def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  # define the assignment w "or equals" (if @current_user is undefined)
  def current_user
    @current_user ||= user_from_remember_token
  end

  # for users_controllers.rb
  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end

  private

    def user_from_remember_token
      remember_token = cookies[:remember_token]
      User.find_by_remember_token(remember_token) unless remember_token.nil?
    end

    def clear_return_to
      session.delete(:return_to)
    end
end
