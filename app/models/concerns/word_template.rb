# This DRY-enabling class encapsulates all the template logic
class WordTemplate

  attr_reader :template

  class << self
    # includes all the template-construction logic
    # @param text [String] a word to categorize
    # @return [WordTemplate] a template with a pattern in [xcC]
    def for(text)
      if text =~ /-/ || text[0] !~ /[A-Z]/
        pattern = 'x'
      elsif text =~ /^[A-Z][A-Z]+$/
        pattern = 'C'
      else
        pattern = 'c'
      end

      WordTemplate.new(pattern)
    end
  end

  # @param [String] pattern for a template, like (xcC)
  def initialize(pattern)
    raise(ArgumentError, "template \'#{pattern}\' must be one of {x,c,C}") if pattern.match(/^[xcC]$/).nil?
    @template = pattern
  end

  # includes all the template-interpretation logic
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
      raise(ArgumentError, "template \'#{@template}\' must be one of {x,c,C} for \'#{text}\'")
    end
  end
end
