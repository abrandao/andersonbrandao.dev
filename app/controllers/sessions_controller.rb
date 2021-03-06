class SessionsController < ApplicationController

  layout 'welcome'
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path, notice: 'Logado.'
    else
      flash.now.alert = "Email ou senha incorretos."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Deslogado.'
  end
end
