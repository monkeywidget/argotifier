require 'thor'
require 'active_support/concern'
require 'English'

require_relative 'subcommands/dictionary'

# require_relative 'concerns/foo_decorator'

# @note http://whatisthor.com/
module Argotifier
  class ArgotifierCLI < Thor
    check_unknown_options!

    # include Argotifier::FooDecorator

    # sets exit code "1" on fail
    def self.exit_on_failure?
      true
    end

    desc 'version', 'Print the version'.freeze

    def version
      puts "argotifier #{Argotifier::VERSION}"
    end

    desc 'dictionary', 'Load or Save the word list'.freeze
    # subcommands: load save stats
    subcommand "dictionary", Dictionary

    desc 'document', 'Load or Save the base document or its translation'.freeze

    # Load or Save the base document or its translation
    def document
    end

    desc 'paragraph', 'Print the translation of a paragraph, or a range'.freeze

    # Print the translation of a paragraph, or a range
    def paragraph
    end

    desc 'translation', 'Set a translation, or show what words translate to this'.freeze

    # Set a translation, or show what words translate to this
    def translation
    end

    desc 'word', 'Word finders'.freeze

    # word finders
    def word
    end

    desc 'sentence', 'Show original or translated sentences matching a substring'.freeze

    # Show original or translated sentences matching a substring
    def sentence
    end
  end
end
