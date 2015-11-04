# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sensu/package/metrics/version'

Gem::Specification.new do |spec|
  spec.name          = "sensu-package-metrics"
  spec.version       = Sensu::Package::Metrics::VERSION
  spec.authors       = ["Christopher Holmes"]
  spec.email         = ["christopher.holmes@digital.cabinet-office.gov.uk"]
  spec.summary       = %q{A sensu plugin for reporting the versions of packages}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
