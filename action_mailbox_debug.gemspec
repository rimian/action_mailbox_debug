# frozen_string_literal: true

require_relative 'lib/action_mailbox_debug/version'

Gem::Specification.new do |spec|
  spec.name          = 'action_mailbox_debug'
  spec.version       = ActionMailboxDebug::VERSION
  spec.authors       = ['Rimian Perkins']
  spec.email         = ['hello@rimian.com.au']

  spec.summary       = "This is a helper to debug Action Mailbox. It's not suitable for running on production servers."
  spec.description   = "This is a helper to debug Action Mailbox. It's not suitable for running on production servers."
  spec.homepage      = 'https://github.com/rimian/action_mailbox_debug'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
