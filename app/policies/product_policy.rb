class ProductPolicy < ApplicationPolicy

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

  def show?
    !user.guest? || record.pro
  end

  def pro?
    user.admin?
  end

  def buy?
    user.guest? &&
    !record.pro &&
    !record.shopname.empty? &&
    !(user.email[-3,3] == 'com')
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
