module Api
  module V1  
    class UsersController < Api::V1::ApiController
      
      def show
        begin
          @user = User.find(params[:id])
          if @user
           render_success_response({
                                      user: single_serializer.new(@user, serializer: UsersSerializer)
                                    })
          else
            render_unprocessable_entity(error:  "User with id #{params[:id]} not found.")
          end
        rescue => e
          render_unprocessable_entity(error: e.message)
        end
      end

      def update
        begin
          @user = User.find(params[:id])
            if @user.update!(user_params)
              render_success_response({
                user: single_serializer.new(@user, serializer: UsersSerializer)
              })
            else
               render_unprocessable_entity(error: "Invalid user information")
            end
        rescue => e
           render_unprocessable_entity(error: e.message)
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :is_active)
      end
    end
  end
end