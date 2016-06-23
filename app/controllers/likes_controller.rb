class LikesController < ApplicationController
  def index
  end

  def create
  	secret = Secret.find(params[:secret_id])
  	like = Like.create(user: current_user, secret: secret)
  	redirect_to "/secrets"
  end
  
  def destroy
  	like = Like.find(params[:id]).destroy
  	redirect_to	'/secrets'
  end
end
