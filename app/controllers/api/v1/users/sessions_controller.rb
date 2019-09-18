module Api
  module V1
    module Users
      class SessionsController < Api::V1::ApiController
        include ::SessionHelper::Helpers
        include AuthTokenConcern
        skip_before_action :authenticate_user!, only: [:login]
        before_action :verify_auth_token, only: [:logout]
        before_action :get_user_details, only: [:login]

        # include Verify


      def login
        if @user.present?
          render_success_response({
                                      user: single_serializer.new(@user, serializer: RegistrationSerializer)
                                    })
        else
          render_unprocessable_entity(error: 'Invalid credentials')
          # render json: {error: 'Invalid credentials'}, status: :unauthorized
        end
      end

      def logout
        if @auth_token
          @auth_token.destroy
          render json: {}, status: :ok
        else
          render_unprocessable_entity(error: 'Auth token is not valid')
        end
      end
        
        private

        def get_user_details
          begin
            if user_params[:mobile_number].present? && params['verification_code_id'].present? && params['otp'].present?
              verification_code = VerificationCode.find_by_id_and_code(params['verification_code_id'], params['otp'])
              if !verification_code.present?
                render_unprocessable_entity(error: "Verification code is invalid")
              elsif !verification_code.is_valid_code?
                render_unprocessable_entity(error: "Your verification code has expired. Please request another.")
              elsif verification_code.present?
                user = User.find_by(mobile_number: user_params[:mobile_number], client_id: $client.id)
                if user.present? && user.aasm_state != 'processing'
                  auth_hash = { user_id: user.id, platform: params['platform'], device_type: params['device_type'], device_udid_number: params['device_udid_number']}
                  auth_token = generate_token(auth_hash)
                  if auth_token
                    @user = user
                  end
                end
              end
            elsif user_params[:email].present? && user_params[:password].present?
              user = User.find_by(email: user_params[:email], client_id: $client.id)
              if user.present? && user.authenticate(user_params[:password])
                auth_hash = { user_id: user.id, platform: params['platform'], device_type: params['device_type'], device_udid_number: params['device_udid_number']}
                auth_token = generate_token(auth_hash)
                if auth_token
                  @user = user
                end
              end
            end
          rescue => e
            render_unprocessable_entity(error: e.message)
          end
        end

        def user_params
          params.require(:user).permit(:mobile_number, :registered_via, :email, :password, :password_confirmation).merge(client_id: $client.id)
        end
      end
    end
  end
end
