RailsAdmin.config do |config|

  config.model 'Castle' do
    object_label_method do
      :custom_label_method
    end
    show do 
      field :castle_name_en do
        bindings[:view].tag(:img, { :src => bindings[:object].highlighted.fullpicture }) << value
      end
    end
  end

  def custom_label_method
    "Castle: #{self.castle_name_en}"
  end


#  config.model Photo do
#    field :castles do
#      inverse_of :photos
#    end
#  end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
