class ProductPolicy < ApplicationPolicy

  def pro?
    user.role == "admin"
  end

  def create?
    user.role == "shopkeeper"
  end
end
