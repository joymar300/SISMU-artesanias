class ProductoPolicy < ApplicationPolicy
  attr_reader :user, :producto
  
  def initialize(user, producto)
    @user = user
    @producto = producto
    
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
     def resolve
       scope.all
     end
  end
  def index?
    @user.has_role? :admin
  end
  def new?
    @user.has_role? :admin
  end
  def edit?
    @user.has_role? :admin
  end
  def show?
    @user.has_role? :admin
  end
end
