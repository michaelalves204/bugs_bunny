# frozen_string_literal: true

require_relative 'lib/bugs_bunny/version'

Gem::Specification.new do |spec|
  spec.name = 'bugs_bunny'
  spec.version = BugsBunny::VERSION
  spec.authors = ['michael.alves2']
  spec.email = ['michaelalvesreino404@outlook.com']

  spec.summary = 'A tool for monitoring RabbitMQ queues'
  spec.description = 'This gem provides a simple interface for monitoring RabbitMQ queues.'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'
  spec.add_dependency 'bunny', '~> 2.22'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
