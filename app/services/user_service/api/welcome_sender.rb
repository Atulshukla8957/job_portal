module UserService::API
  module WelcomeSender

    module_function
    def self.send_welcome_message_to(user)
      WelcomeMessage.send_welcome_message(user)
    end
  end
end