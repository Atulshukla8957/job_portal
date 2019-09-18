module UserService::API
  module ConfirmationSender

    module_function
    def self.send_confirmation_to(verification_code)
      MessageSender.send_code(verification_code)
	  end
  end
end