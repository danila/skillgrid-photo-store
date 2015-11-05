class ProductPolicy < ApplicationPolicy

  def pro?
    user.admin?
  end

  def create?
    user.shopkeeper?
  end

  def index?
    logged_in?
  end

  def update?
    # user.shopkeeper? && (user.id == product.user_id)
    false
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      if !user
        scope.none
      elsif user.guest?
        scope.where(pro: true)
      else
        scope.all
      end
    end
  end
end
