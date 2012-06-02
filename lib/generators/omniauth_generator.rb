require 'fileutils'
module SocialLogin
  module Generators
    class OmniauthGenerator < Rails::Generators::Base
      desc "Creates the omniauth file to configure the authentication."
      source_root File.expand_path("../../templates", __FILE__)

      FileUtils.cp("../../template/omniauth.rb", "config/initializers/omniauth.rb")
      
    end
  end
end
