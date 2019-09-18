class Api::V1::ApiController < ActionController::API
  include ApplicationMethods
  attr_reader :current_user
  before_action :authenticate_user!, unless: :ensure_admin?

  protected

  # derive the model name from the controller. egs UsersController will return User
  def self.permission
    name = begin
             self.name.gsub('Controller', '').singularize.split('::').last.constantize.name
           rescue StandardError
             nil
           end
  end

  private

  def authenticate_user!
    token = request.headers["Authorization"]
    if !token.nil?
      @current_user = User.eager_load(:auth_tokens).where('auth_tokens.token = ?', token.to_s).last
    end
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def ensure_admin?
    request.path.start_with?("/admin")
  end


end
