require "minitest/autorun"
require "shellwords"

describe "nem" do
  it "takes a gemspec and generates a package.json out of it" do
    assert_equal <<PACKAGE_JSON, `echo #{<<NEM_GEMSPEC.shellescape} | #{File.dirname(__FILE__)}/../bin/nem ruby gem npm`
{
  "name": "nem",
  "version": "1.0.0",
  "description": "Publish dependency free Ruby CLI gems on npm",
  "homepage": "https://github.com/janlelis/nem",
  "author": {
    "name": "Jan Lelis",
    "email": "mail@janlelis.de"
  },
  "keywords": [
    "nem",
    "ruby",
    "gem",
    "npm"
  ],
  "preferGlobal": true,
  "bin": {
    "nem": "bin/nem"
  },
  "license": "MIT"
}
PACKAGE_JSON
Gem::Specification.new do |gem|
  gem.name          = "nem"
  gem.version       = "1.0.0"
  gem.summary       = "npm + gem = nem"
  gem.description   = "Publish dependency free Ruby CLI gems on npm"
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
NEM_GEMSPEC
  end
end

