class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  def new
    #@comment = Comment.new
  end

  def create
    @comment = Comment.new('gossip_id' => params[:gossip_id], 'content' => params[:content], user_id: current_user.id)
    if @comment.save
      puts "The super commentaires was succesfully saved !"
      flash[:success] = "Commentaire créé !"
      redirect_to '/'
    else
      puts "Error : you need to complete this field user_id/gossip_id"
      flash[:notice] = "Commentaire non ajouté !"
      render '/gossips'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment_params = params.permit(:content)
    if @comment.update(@comment_params)
      flash[:success] = "Commentaire mis à jour !"
      redirect_to '/'
    else
      render :edit
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Commentaire supprimé !"
    redirect_to gossips_path
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Vous devez vous connecter"
      redirect_to new_session_path
    end
  end
end
