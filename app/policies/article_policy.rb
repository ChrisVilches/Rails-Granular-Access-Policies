class ArticlePolicy < ApplicationPolicy

  def index?
    user.permission?("LEER")
  end

  def create?
    user.permission?("CREAR")
  end

  def update?
    user.permission?("EDITAR") || (record.user_id == user.id && user.permission?("EDITAR_PROPIOS"))
  end

  def destroy?
    user.permission?("ELIMINAR") || (record.user_id == user.id && user.permission?("ELIMINAR_PROPIOS"))
  end

end
