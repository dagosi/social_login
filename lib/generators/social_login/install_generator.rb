require "rails/generators"
require "fileutils"

module SocialLogin
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)
    
    desc "Initial configuration."
    
    def create_omniauth_file
      template 'omniauth.rb', 'config/initializers/omniauth.rb'
    end
    
    def create_routes
      tempfile = File.open("config/routes.tmp", 'w')
      f = File.new("config/routes.rb")
      f.each do |line|
        tempfile << line
        if line.include?("Application.routes.draw")
          tempfile << "  match '/auth/:provider/callback' => authentications#create"
        end
      end
      f.close
      tempfile.close
      FileUtils.mv("config/routes.tmp", "config/routes.rb")
    end

    def create_dependencies
      tempfile = File.open("Gemfile.tmp", 'w')
      f = File.new("Gemfile")
      wrote = false
      f.each do |line|
        tempfile << line
        if not wrote && line.include?("gem 'rails'") 
          tempfile << "gem 'omniauth-twitter'\n"
          tempfile << "gem 'omniauth-facebook'\n"
          tempfile << "gem 'omniauth-linkedin'\n"
          wrote = true
        end
      end
      f.close
      tempfile.close
      FileUtils.mv("Gemfile.tmp", "Gemfile")
    end
    
    puts "Now you have to create the authentication model."
    puts "This is an example:"
    puts "rails g controller authentication user_id:integer provider:string uid:string"
  end
end
