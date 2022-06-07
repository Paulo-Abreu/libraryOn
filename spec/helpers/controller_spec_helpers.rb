module ControllerSpecHelpers
  def authenticate(user)
    allow_any_instance_of(ApplicationController).to receive(:authorize_request).and_return(true)
  def authenticate user
    token = Token.where(user_id: user.id).first || Factory.create(:token, user_id: user.id)
    request.env['Authorization'] = ActionController::HttpAuthentication::Token.encode_credentials(token.hex)
  end
end