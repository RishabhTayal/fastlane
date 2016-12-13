# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/version'

# Copy over the latest .rubocop.yml style guide
rubocop_config = File.expand_path('../../.rubocop.yml', __FILE__)
`cp #{rubocop_config} #{lib}/fastlane/plugins/template/.rubocop.yml`

Gem::Specification.new do |spec|
  spec.name          = "fastlane"
  spec.version       = "2.0.0"
  spec.authors       = ["Felix Krause", "Michael Furtak", "Andrea Falcone", "Sam Phillips", "David Ohayon", "Sam Robbins", "Mark Pirri", "Hemal Shah"]
  spec.email         = ["fastlane@krausefx.com"]
  spec.summary       = Fastlane::DESCRIPTION
  spec.description   = Fastlane::DESCRIPTION
  spec.homepage      = "https://fastlane.tools"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'

  spec.files = Dir.glob("lib/**/*", File::FNM_DOTMATCH) + %w(bin/fastlane bin/🚀 README.md LICENSE) - Dir.glob("lib/fastlane/actions/device_grid/assets/*")

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # Lock `activesupport` (transitive depedency via `xcodeproj`) to keep supporting system ruby
  spec.add_dependency 'activesupport', '< 5'

  # Development only
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.2.3'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'yard', '~> 0.8.7.4'
  spec.add_development_dependency 'webmock', '~> 1.19.0'
  spec.add_development_dependency 'coveralls', '~> 0.8.13'
  spec.add_development_dependency 'rubocop', '~> 0.44.0'
  spec.add_development_dependency 'rest-client', '~> 1.6.7'
  spec.add_development_dependency 'fakefs', '~> 0.8.1'

  spec.post_install_message = "Please use `fastlane #{spec.name}` instead of `#{spec.name}` from now on."
end
