module ControllerSpecHelpers
  def authenticate(user)
    allow_any_instance_of(ApplicationController).to receive(:authorize_request).and_return(true)
  end
end