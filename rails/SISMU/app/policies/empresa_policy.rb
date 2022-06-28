class EmpresaPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  attr_reader :user,  :empresa
  
  def initialize(user, empresa)
    @user = user
    @empresa = empresa
  end

  def index?
    @user.has_role? :admin
  end
end
