module Api
  module V1
    module Users
      class RegistrationsController < Api::V1::ApiController
        include AuthTokenConcern
        skip_before_action :authenticate_user!

        before_action :verify_otp, only: [:create]

        def create
          begin
            ActiveRecord::Base.transaction do
              @user = User.new(user_params)
              if @user.save!
                auth_hash = { user_id: @user.id, platform: params['platform'], device_type: params['device_type'], device_udid_number: params['device_udid_number']}
                _ = generate_token(auth_hash)
                render_success_response({
                                      user: single_serializer.new(@user, serializer: RegistrationSerializer)
                                    }, "You are successfully logged in!", )
              end
            end
          rescue => e
           render_unprocessable_entity(error: e.message)
          end
        end

        def forgot_password
          begin
            @user = User.find_by(email: user_params[:email])
            if @user.present?
              @user.set_reset_password_token
              render json: {user: @user }, methods: :auth_token, status: :created
              # render_success_response({
              #                         user: single_serializer.new(@user, serializer: RegistrationSerializer)
              #                       }, "Password reset link sent successfully")
            end
          rescue => e
            render_unprocessable_entity(error: e.message)
          end
        end

        private

        def verify_otp
          if user_params[:mobile_number].present? && params['verification_code_id'].present? && params['otp'].present?
            verification_code = VerificationCode.find_by_id_and_code(params['verification_code_id'], params['otp'])
            if !verification_code.present?
              render_unprocessable_entity(error: "Your verification code has expired. Please request another", status: :not_found)
            elsif !verification_code.is_valid_code?
              render_unprocessable_entity(error: "Your verification code has expired. Please request another")
            end
          end
        end

        def user_params
          params.require(:user).permit(:mobile_number, :email, :password, :password_confirmation)
        end
      end
    end
  end
end
