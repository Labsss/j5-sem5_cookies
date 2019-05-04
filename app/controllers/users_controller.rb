require 'bcrypt'
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    
  end

  def new
    @user = User.new
    @all_cities = City.all
  end

  def create
    if params[:password] == '' || params[:email] == ''
      puts "Error : you need to complete this field email/pw"
      flash[:Notice] = "Utilisateur non créé"
      render '/users/new'
     else

        #@user = User.create('last_name': params[:last_name], 'first_name': params[:first_name], 'email': params[:email], 'age': params[:age], 'password_digest': BCrypt::Password.create(params[:password]), 'description': params[:description], 'city_id': params[:city].to_i)
        #@user = User.create('email': params[:email], 'password_digest': BCrypt::Password.create(params[:password])
        @user = User.create('last_name': params[:last_name], 'first_name': params[:first_name], 'email': params[:email], 'age': params[:age], 'password': params[:password], 'description': params[:description], 'city_id': params[:city].to_i)
        puts "The user #{params[:email]}was succesfully saved !"
        flash[:success] = "Utilisateur créé !"
        log_in(@user)
        redirect_to '/'
     end
  end

  def edit
    
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    def destroy
      session[:user_id] = nil
      flash[:notice] = "Utilisateur déconnecté !"
      redirect_to '/login'
    end
  end
end
