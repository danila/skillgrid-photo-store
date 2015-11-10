class ProductPolicy < ApplicationPolicy
  attr_accessor :error_message

  def create?
    user.shopkeeper?
  end

  def update?
    # user.shopkeeper? && (user.id == product.user_id)
    false
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
    if !user
      @error_message = 'You must be logged in to perform a purchase'
    elsif record.pro
      @error_message = 'Guests can\'t purchase PRO products'
    elsif !record.shopname
      @error_message = 'We\'re sorry, but this product doesn\'t
                        belong to any shop'
    elsif !user.guest?
      @error_message = 'You must be a guest to perform a purchase'
    elsif (user.email[-3, 3] == 'com')
      @error_message = 'Guests with email in \'.com\' domain
                        zone can\'t buy products'
    else
      return true
    end
    false
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
