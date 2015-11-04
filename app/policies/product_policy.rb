class ProductPolicy < ApplicationPolicy

  def pro?
    user.role == "admin"
  end
end
