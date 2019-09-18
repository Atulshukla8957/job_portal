module AuthTokenConcern
  extend ActiveSupport::Concern
  
  def generate_token params
    auth_token = UserService::API::AuthTokens.create_login_token(params)
  end
end