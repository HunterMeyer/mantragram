class RegistrationsController < Devise::RegistrationsController

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      flash[:success] = 'Got it. Your password has been updated.'
      sign_in resource_name, resource, bypass: true
      redirect_to user_path(resource)
    else
      clean_up_passwords resource
      flash[:danger] = 'Whoops. That was the incorrect current password.'
      redirect_to user_path(resource)
    end
  end

end
