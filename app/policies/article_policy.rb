class ArticlePolicy < ApplicationPolicy
  def create?
    user.permission?("CREAR")
  end
end
