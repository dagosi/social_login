require "rails/generators"

module SocialLogin
  class CreateAuthenticationGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)
    
    desc "Creates the file that configure the authentication on the creation."
    
    def create_omniauth_file
      template 'create_authentication.rb', 'public/create_authentication.rb'
    end
  end
end
