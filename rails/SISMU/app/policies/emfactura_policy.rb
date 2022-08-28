class EmfacturaPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  attr_reader :user,  :emfactura
  
  def initialize(user, emfactura)
    @user = user
    @emfactura = emfactura
  end

  def index?
    @user.has_any_role? :admin, :perla

  end
  def new?
    @user.has_any_role? :admin, :perla
  
  end
  def edit?
    @user.has_any_role? :admin, :perla
   
  end
  def show?
    @user.has_any_role? :admin, :perla
 
  end
end
