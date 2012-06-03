require "rails/generators"

module SocialLogin
  class CreateAuthenticationGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)
    
    desc "Creates the file that configure the authentication on the creation."
    
    def create_omniauth_file
      template 'create_authentication.rb', 'public/create_authentication.rb'
    end

    def copy_auth_images
      template 'images/twitter_64.png', 'app/assets/images/twitter_64.png'
      template 'images/facebook_64.png', 'app/assets/images/facebook_64.png'
      template 'images/linkedin_64.png', 'app/assets/images/linkedin_64.png'
    end
    
    def create_authentication_partials
      
      auth = File.open("public/_auth.html.erb", "w")
      auth << "<%= link_to(image_tag('twitter_64.png', :size => '64x64', :alt => 'Twitter'), '/auth/twitter') %>\n"
      auth << "<%= link_to(image_tag('facebook_64.png', :size => '64x64', :alt => 'Facebook'), '/auth/facebook') %>\n"
      auth << "<%= link_to(image_tag('linkedin_64.png', :size => '64x64', :alt => 'LinkedIn'), '/auth/linkedin') %>\n"
      auth.close
    end

  end
end
