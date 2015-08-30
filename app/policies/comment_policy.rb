class CommentPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @comment = model
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    @current_user.admin? or @current_user.id == @comment.user_id
  end

  def destroy?
    return false if @current_user.nil?
    @current_user.admin? or @current_user.id == @comment.user_id
  end

#  class Scope < Struct.new(:current_user, :model)
#    def resolve
#      if current_user.nil?
#        model.where(approved: '1').order("castle_name_en ASC")        
#      elsif current_user.admin?
#        model.all
#      else
#        model.where(approved: '1').order("castle_name_en ASC")
#      end
#    end
#  end

end
