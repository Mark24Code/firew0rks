# frozen_string_literal: true

require_relative "lib/firew0rks/version"

Gem::Specification.new do |spec|
  spec.name = "firew0rks"
  spec.version = Firew0rks::VERSION
  spec.authors = ["Mark24"]
  spec.email = ["mark.zhangyoung@gmail.com"]

  spec.summary = "Fireworks in your terminal 🎆 "
  spec.description = "Fireworks in your terminal 🎆 power by Ruby"
  spec.homepage = "https://github.com/Mark24Code/firew0rks"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"


  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Mark24Code/firew0rks"
  spec.metadata["changelog_uri"] = "https://github.com/Mark24Code/firew0rks"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile sample/])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
