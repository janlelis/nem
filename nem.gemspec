# -*- encoding: utf-8 -*-

require File.dirname(__FILE__) + "/lib/nem/version"

Gem::Specification.new do |gem|
  gem.name          = "nem"
  gem.version       = Nem::VERSION
  gem.summary       = "npm + gem = nem"
  gem.description   = "npm + gem = nem: Publish dependency free Ruby CLI gems on npm"
  gem.authors       = ["Jan Lelis"]
  gem.email         = ["mail@janlelis.de"]
  gem.homepage      = "https://github.com/janlelis/nem"
  gem.license       = "MIT"

  gem.files         = Dir["{**/}{.*,*}"].select{ |path| File.file?(path) && path !~ /^pkg/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = "~> 2.0"
end
