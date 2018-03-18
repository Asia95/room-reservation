RailsAdmin.config do |config|

  ### Popular gems integration

  # # == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.try(:admin?)
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

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
  end

    ## With an audit adapter, you can add:
    # history_index
    # history_show

  config.model 'User' do
    list do
      field :id
      field :admin
      field :email
      field :created_at
      field :current_sign_in_at
      field :sign_in_count
    end
  end

  config.model 'Reservation' do
    list do
      field :id
      field :user
      field :room
      field :start_date
      field :end_date
      field :created_at
    end
  end
end
