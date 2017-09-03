class HomeController < ApplicationController

  before_action :authenticate_user!
  

  def index

    @permissions = Permission.all
    @roles = Role.all.includes(:permissions)
    @user = current_user
    @articles = Article.all.includes(:user)

  end

end
