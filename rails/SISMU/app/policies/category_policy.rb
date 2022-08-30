class CategoryPolicy < ApplicationPolicy
    class Scope < Scope
      # NOTE: Be explicit about which records you allow access to!
      # def resolve
      #   scope.all
      # end
    end
    attr_reader :user,  :category
    
    def initialize(user, category)
      @user = user
      @category = category
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
  