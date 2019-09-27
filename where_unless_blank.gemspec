
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "where_unless_blank/version"

Gem::Specification.new do |spec|
  spec.name          = "where_unless_blank"
  spec.version       = WhereUnlessBlank::VERSION
  spec.authors       = ["Wagner Caixeta"]
  spec.email         = ["wagner.caixeta@al.go.leg.br"]

  spec.summary       = %q{This gem removes statements with null/blank values from query.}
  spec.description   = %q{
    This gem removes statements with null/blank values from query.
    Very usefull for search forms avoiding you to worry about unfilled fields.
  }
  spec.homepage      = "https://github.com/platbr/where_unless_blank"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
