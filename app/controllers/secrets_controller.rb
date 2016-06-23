class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]

  def index
  	@secrets = Secret.all
  end

  def create
  	# Secret.create(content: params[:content], user_id: params[:id])
  	Secret.create(content: params[:content], user: current_user)
	  redirect_to "/users/#{current_user.id}"
	# redirect_to	current_user
  end
  
  def destroy
  	secret = Secret.find(params[:id])
    secret.destroy if secret.user == current_user
  	redirect_to "/users/#{current_user.id}"
	# redirect_to	current_user
  end

  # private
  # 	def secret_params
  # 		params.require(:secret).permit(:content)
  # 	end
end
