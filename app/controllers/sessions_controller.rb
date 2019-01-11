class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    response = GithubService.new
    session[:token] = response.authenticate!(ENV['GITHUB_CLIENT'], ENV['GITHUB_SECRET'], params[:code])
    session[:username] = response.get_username
    redirect_to '/'
  end
end
