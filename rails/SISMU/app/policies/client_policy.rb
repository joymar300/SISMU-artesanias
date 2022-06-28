class ClientPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  attr_reader :user,  :client
  
  def initialize(user, client)
    @user = user
    @client = client
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
