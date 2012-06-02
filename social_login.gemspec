# -*- encoding: utf-8 -*-
require File.expand_path('../lib/social_login/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Daniel Gomez Sierra"]
  gem.email         = ["danielgomezsierra@gmail.com"]
  gem.description   = %q{This gem help you to login to different social networks (Academic project).}
  gem.summary       = %q{This gem help you to login to different social networks (Academic project).}
  gem.homepage      = "http://github.com/dagosi89/social_login"

  gem.add_development_dependency "rspec"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "social_login"
  gem.require_paths = ["lib"]
  gem.version       = SocialLogin::VERSION
end
