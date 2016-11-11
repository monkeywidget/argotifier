class WordTemplate

  attr_reader :template

  class << self
    # @param text [String] a word to categorize
    # @return [WordTemplate] a template with a pattern in [xcC]
    def for(text)
      if text[0] !~ /[A-Z]/
        pattern = 'x'
      elsif text =~ /^[A-Z][A-Z]+$/
        pattern = 'C'
      else
        pattern = 'C'
      end

      WordTemplate.new(pattern)
    end
  end

  # @param [String] pattern
  def initialize(pattern)
    @template = pattern
  end

  # @param text [String] the word to render
  # @return [String] the rendered word
  def render(text)
    case @template
    when 'x'
      text.downcase
    when 'c'
      text.capitalize
    when 'C'
      text.upcase
    else
      raise(ArgumentError, "template \'#{@template}\' must be in [xcC] for \'#{text}\'")
    end
  end
end
