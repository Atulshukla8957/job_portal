module UserService::API
  module CodeGenerator

    module_function
    def self.generate
    	rand(100000...999999).to_s
  	end
  end
end