class RolesController < ApplicationController

  before_action do
    authenticate_user!
    authorize Role
  end

  def index
    respond_to do |format|
      format.json {
        @roles = Role.all.includes(:permissions)
        @permissions = Permission.all
        render 'index', formats: 'json', handlers: 'jbuilder'
      }
      format.html
    end
  end
end
