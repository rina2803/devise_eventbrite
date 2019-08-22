class UsersController < ApplicationController
	
  def show
  	@user = current_user
  	@user = User.find(params[:id])
  
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  
end
