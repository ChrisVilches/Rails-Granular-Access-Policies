class RolesController < ApplicationController

  before_action :authenticate_user!

  def index
    @roles = Role.all.includes(:permissions)
    @permissions = Permission.all
  end
end
