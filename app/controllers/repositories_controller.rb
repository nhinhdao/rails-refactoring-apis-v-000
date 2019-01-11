class RepositoriesController < ApplicationController
  def index
    response = GithubService.new({"access_token": session[:token]})
    @repos_array = response.get_repos
    byebug
  end

  def create
    response = GithubService.new({"access_token": session[:token]})
    response.create_repo(params[:name])
    redirect_to '/'
  end
end
