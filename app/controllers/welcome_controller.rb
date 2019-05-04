class WelcomeController < ApplicationController
  def first_name
    puts "*" * 50
    puts params[:first_name]
    puts "*" * 50
  end
end
