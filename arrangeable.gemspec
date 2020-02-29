lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "arrangeable/version"

Gem::Specification.new do |spec|
  spec.name          = "arrangeable"
  spec.version       = Arrangeable::VERSION
  spec.authors       = ["Umar Al-Kfaween"]
  spec.email         = ["omar.ka923@gmail.com"]

  spec.summary       = %q{Arrangeable provides an organized and seamless way to sort your ActiveRecord objects by different attributes. }
  spec.description   = %q{Arrangeable provides an organized and seamless way to sort your ActiveRecord objects by different attributes. }
  spec.homepage      = "https://github.com/umar221b/arrangeable"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.2.2'

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/umar221b/arrangeable"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 4.2.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
