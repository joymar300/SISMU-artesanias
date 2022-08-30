class ColorPolicy < ApplicationPolicy
    class Scope < Scope
      # NOTE: Be explicit about which records you allow access to!
      # def resolve
      #   scope.all
      # end
    end
    attr_reader :user,  :color
    
    def initialize(user, color)
      @user = user
      @color = color
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
  