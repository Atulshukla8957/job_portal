module UserService::API
  module WelcomeMessage

    module_function

    def self.send_welcome_message(user)
      account_sid = Settings.TWILIO_ACCOUNT_SID
      auth_token  = Settings.TWILIO_AUTH_TOKEN
      begin
        client = Twilio::REST::Client.new(account_sid, auth_token)
        mobile_number = user.mobile_number.length === 10 ? "+44#{user.mobile_number}" : "+#{user.mobile_number}"
        message = client.messages.create(
          from:  Settings.TWILIO_NUMBER,
          to:    mobile_number,
          body:  "Thank you for registering on FAZremit! Please visit 'ID CHECK' section to complete verification process"        )
      rescue Twilio::REST::TwilioError => e
        raise e
      end
    end
  end
end