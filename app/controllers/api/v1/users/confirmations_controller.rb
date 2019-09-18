module Api
  module V1
    module Users
      class ConfirmationsController < Api::V1::ApiController
        skip_before_action :authenticate_user!

        def show
          user = User.find_by(confirmation_token: params[:confirmation_token])
          if user.present?
            user.update!(email_verified: true)
            user.onboarding!
            redirect_to "#{$host_url}/sign-in"
          else
            redirect_to $host_url
          end
        end

        def reset_password
          user = User.find_by(reset_password_token: params[:reset_password_token])
          if user.present?
            redirect_to "#{$host_url}/password?reset_password_token=#{user.reset_password_token}"
          else
            redirect_to $host_url
          end
        end

        def verify_code
          p params[:purpose]
        end
      end
    end
  end
end
