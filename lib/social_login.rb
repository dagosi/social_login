require "social_login/version"
require "social_login/translator"

module SocialLogin

  def self.create_omniauth_initializer
    File.open("config/initializers/omniauth.rb", "w") do |file|
      info = ""
      info << "Rails.application.config.middleware.use OmniAuth::Builder do\n"
      info << "  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'\n"
      info << "  provider :facebook, 'CONSUMER_KEY', 'CONSUMER_SECRET'\n"
      info << "  provider :linkedin, 'CONSUMER_KEY', 'CONSUMER_SECRET'\n"
      info << "end\n"
      file.puts info
    end
  end

  def self.hi(language = :english)
    translator = Translator.new(language)
    translator.hi
  end
end
