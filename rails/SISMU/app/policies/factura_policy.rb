class FacturaPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  attr_reader :user,  :factura
  
  def initialize(user, factura)
    @user = user
    @factura= factura
  end

  def index?
    @user.has_role? :admin
  end
end
