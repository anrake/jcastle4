class UserPolicy < ApplicationPolicy
  
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
#    @current_user = current_user
  end

  def index?
    return false if @current_user.nil?
    @current_user.admin?
  end

  def show?
    @current_user.admin? or @current_user == @user
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end

def rails_admin?(action)
    case action
      when :destroy, :new
        false
      else
        super
    end
  end

end
