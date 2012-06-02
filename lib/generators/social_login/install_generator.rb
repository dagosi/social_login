require "rails/generators"
require "fileutils"

module SocialLogin
  class OmniauthGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)
    
    desc "Creates the omniauth file to configure the authentication."
    
    #root = File.expand_path("../templates/", __FILE__)
    #puts root
    def create_omniauth_file
      template 'omniauth.rb', 'config/initializers/omniauth.rb'
    end
    
    def create_routes
      tempfile = File.open("config/routes.tmp", 'w')
      f = File.new("config/routes.rb")
      f.each do |line|
        tempfile << line
        if line.include?("Application.routes.draw")
          tempfile << "  match '/auth/:provider/callback' => # Create controller action."
        end
      end
      f.close
      tempfile.close
      FileUtils.mv("config/routes.tmp", "config/routes.rb")
    end

    def create_dependencies
      tempfile = File.open("Gemfile.tmp", 'w')
      f = File.new("Gemfile")
      f.each do |line|
        tempfile << line
        if line.include?("gem 'rails'")
          tempfile << "gem 'omniauth-twitter'"
          tempfile << "gem 'omniauth-facebook'"
          tempfile << "gem 'omniauth-linkedin'"
        end
      end
      f.close
      tempfile.close
      FileUtils.mv("Gemfile.tmp", "Gemfile")
    end
    
  end
end
