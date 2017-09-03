class RolePolicy < ApplicationPolicy

  def index?
    user.permission?("VER_ROLES_PERMISO")
  end

end
