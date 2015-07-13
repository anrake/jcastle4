class CastlePolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end

  class Scope < Struct.new(:current_user, :model)
    def resolve
      if current_user.nil?
        model.where(approved: '1').order("castle_name_en ASC")        
      elsif current_user.admin?
        model.all
      else
        model.where(approved: '1').order("castle_name_en ASC")
      end
    end
  end

end
