require 'ftools'
module SocialLogin
  module Generators
    class OmniauthGenerator < Rails::Generators::Base
      desc "Creates the omniauth file to configure the authentication."
      def initialize()
        File.copy("templates/omniauth.rb", "config/initializers/omniauth.rb")
      end
    end
  end
endxs
