class UserPolicy < ApplicationPolicy
  attr_accessor :error_message

  def index?
    @error_message = 'You must be logged in to view this page'
    user && user.admin?
  end

  def edit?
    @error_message = 'You must be logged in to view this page'
    user && user.admin?
  end

  def update?
    @error_message = 'You are not authorized to perform this action'
    user && user.admin?
  end

  class Scope < Scope
    def resolve
      if user && user.admin?
        scope.all
      else
        scope.none
      end
    end
  end

end
