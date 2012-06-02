require 'fileutils'
module SocialLogin
  module Generators
    class OmniauthGenerator < Rails::Generators::Base
      desc "Creates the omniauth file to configure the authentication."
      root = File.expand_path("../templates/", __FILE__)
      puts root
      Fileutils.cp("#{root}/omniauth.rb", "config/initializers/omniauth.rb")
      
    end
  end
end
