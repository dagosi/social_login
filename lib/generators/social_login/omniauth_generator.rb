require "rails/generators"
require "fileutils"

module SocialLogin
  class OmniauthGenerator < Rails::Generators::Base
    source_root File.expand_path("../../../", __FILE__)
    #desc "Creates the omniauth file to configure the authentication."
    #root = File.expand_path("../templates/", __FILE__)
    #puts root
    def puts_hello
      puts "Hello"
    end
    #Fileutils.cp("#{root}/omniauth.rb", "config/initializers/omniauth.rb")
  end
end
