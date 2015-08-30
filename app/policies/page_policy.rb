class PagePolicy < ApplicationPolicy
  
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @page = model
  end

  def index?
    return false if @current_user.nil?
    @current_user.admin?
  end

  def show?
    return true
  end

  def edit?
    @current_user == @page.user
  end 

  def update?
    @current_user.id == @page.user_id
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
