class RolesController < ApplicationController

  before_action do
    authenticate_user!
    authorize Role
  end

  def index
    @roles = Role.all.includes(:permissions)
    @permissions = Permission.all
  end
end
