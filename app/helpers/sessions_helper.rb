module SessionsHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  # retourne true si l'user est loggé
  def logged_in?
    session[:user_id] != nil
  end

end
