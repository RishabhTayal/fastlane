# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deliver/version'

Gem::Specification.new do |spec|
  spec.name          = "deliver"
  spec.version       = Deliver::VERSION
  spec.authors       = ["Felix Krause"]
  spec.email         = ["deliver@krausefx.com"]
  spec.summary       = Deliver::DESCRIPTION
  spec.description   = Deliver::DESCRIPTION
  spec.homepage      = "https://fastlane.tools"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'

  spec.files = Dir["lib/**/*"] + %w( bin/deliver README.md LICENSE )

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # fastlane dependencies
  spec.add_dependency 'fastlane', ">= 2.0.0", "< 3.0.0"

  # third party dependencies
  spec.add_dependency 'fastimage', '>= 1.6'
  spec.add_dependency 'plist', '>= 3.1.0', '< 4.0.0' # for reading the Info.plist of the ipa file

  # Development only
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.2.3'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'yard', '~> 0.8.7.4'
  spec.add_development_dependency 'webmock', '~> 1.19.0'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'fastlane'
  spec.add_development_dependency 'fakefs'
  spec.add_development_dependency 'rubocop', '~> 0.44.0'

  spec.post_install_message = "\e[1;33;40mPlease use `fastlane #{spec.name}` instead of `#{spec.name}` from now on.\e[0m"
end
