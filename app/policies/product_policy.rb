class ProductPolicy < ApplicationPolicy
  attr_accessor :error_message

  def create?
    user.shopkeeper?
  end

  def update?
    return true if user.admin?
    return true if user.shopkeeper? && (user == record.user)
    return 'You are not allowed to perform this action'
  end

  def destroy?
    false
  end

  def show?
    true
  end

  def pro?
    user.admin?
  end

  def buy?
    @error_message = case
      when !user then 'You must be logged in to perform a purchase'
      when record.pro then 'Guests can\'t purchase PRO products'
      when !record.shopname then 'We\'re sorry, but this product doesn\'t belong to any shop'
      when !user.guest? then 'You must be a guest to perform a purchase'
      when user.email.match(/.com\z/) then 'Guests with email in \'.com\' domain zone can\'t buy products'
      else return true
    end
    return false
  end

  class Scope < Scope
    def resolve
      if !user
        scope.where(pro: false)
      else
        scope.all
      end
    end
  end
end
