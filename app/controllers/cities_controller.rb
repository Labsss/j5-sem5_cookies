class CitiesController < ApplicationController
  def new
  end

  def create
  end

  def update
  end 

  def edit
  end

  def destroy
  end

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @cities_users  = []
    @cities_users = User.where(city_id: params[:id])
    @gossips_users = Gossip.where(user_id: @cities_users[1])
    @cities_users.each do |i| 
      print i
      puts @gossips_users.where(user_id: i.id)
    end
    #@gossips_users = 
  end
end
