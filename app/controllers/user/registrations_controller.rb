# frozen_string_literal: true

class User::RegistrationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  def create
    user_registration = User::Registration.find_or_initialize_by(unconfirmed_email: params[:registration][:email])
    if user_registration.save
      super do
        flash[:notice] = "Sending an email confirmation instruction"
        return render :create
      end
    else
      respond_with(user_registration)
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    super do
      return render :show
    end
  end

  def finish
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    ActiveRecord::Base.transaction do
      @user = User.new(nickname: params[:nickname])
      @user_database_authentication = User::DatabaseAuthentication.new(user: @user, email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      @user.save!
      @user_database_authentication.save!
      self.resource.destroy!
    end

    sign_in(:user, @user)
    sign_in(:database_authentication, @user_database_authentication)

    redirect_to posts_path
  rescue
    render :show
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
