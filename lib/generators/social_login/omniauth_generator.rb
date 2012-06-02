require "rails/generators"
require "fileutils"

module SocialLogin
  class OmniauthGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)
    
    desc "Creates the omniauth file to configure the authentication."
    
    #root = File.expand_path("../templates/", __FILE__)
    #puts root
    def create_omniauth_file
      puts "Hello"
      template 'omniauth.rb', 'config/initializers/omniauth.rb'
    end
    #Fileutils.cp("#{root}/omniauth.rb", "")
  end
end
