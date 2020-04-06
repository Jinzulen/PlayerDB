require_relative "./lib/PlayerDB"

Gem::Specification.new do |spec|
  spec.name          = "PlayerDB"
  spec.version       = PlayerDB::VERSION
  spec.authors       = ["Jinzulen"]
  spec.email         = ["Jinzulen@tuta.io"]
  spec.license       = "Apache-2.0"

  spec.summary       = %q{Ruby Client to interface with the PlayerDB API.}
  spec.description   = %q{Ruby Client to interface with the PlayerDB API.}
  spec.homepage      = "https://github.com/Jinzulen/PlayerDB"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/Jinzulen/PlayerDB"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Jinzulen/PlayerDB"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
