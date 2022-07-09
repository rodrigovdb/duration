# frozen_string_literal: true

require_relative 'lib/time_duration/version'

Gem::Specification.new do |spec|
  spec.name = 'time_duration'
  spec.version = TimeDuration::VERSION
  spec.authors = ['Rodrigo Otavio van den Berg Maia']
  spec.email = ['rodrigovdb@gmail.com']

  spec.summary = 'A gem to handle times like 14:03:45 to seconds and vice-versa'
  spec.description = 'A gem to handle times like 14:03:45 to seconds and vice-versa'
  spec.homepage = 'https://github.com/rodrigovdb/time_duration'
  spec.license = 'GPLv3'
  spec.required_ruby_version = '>= 2.6.0'

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end
