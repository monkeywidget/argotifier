# frozen_string_literal: true

require 'thor'
require 'English'

module Argotifier
  describe ArgotifierCLI do
    it 'prints version with zero arguments' do
      expect { subject.version }.to output(/argotifier \d+\.\d+\.\d+/).to_stdout
    end
  end
end
