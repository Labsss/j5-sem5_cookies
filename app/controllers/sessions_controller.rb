
class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    @user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if @user && @user.authenticate(params[:password])
      #session[:user_id] = @user.id
      log_in(@user)
      puts "Login is OK!"
      params[:remember_me] == '1' ? remember(@user) : forget(@user)
      remember(@user)
      flash[:success] = "Utilisateur connecté !"
      redirect_to '/'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(current_user.id)
    session[:user_id] = nil
    log_out if logged_in?
    puts "Vous êtes déconnecté"
    flash[:notice] = "Utilisateur déconnecté !"
    redirect_to '/'  # render :new   ??? a tester
  end
end
