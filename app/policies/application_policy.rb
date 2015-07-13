class ApplicationPolicy

  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
#    @current_user = current_user
  end

  def rails_admin?(action)
    case action
      when :dashboard
        @current_user.admin?
      when :index
        @current_user.admin?
      when :show
        @current_user.admin?
      when :new
        @current_user.admin?
      when :edit
        @current_user.admin?
      when :destroy
        @current_user.admin?
      when :export
        @current_user.admin?
      when :history
        @current_user.admin?
      when :show_in_app
        @current_user.admin?
      else
        raise ::Pundit::NotDefinedError, "unable to find policy #{action} for #{record}."
    end
  end

  # Hash of initial attributes for :new, :create and :update actions. This is optional
  def attributes_for(action)
  end

end