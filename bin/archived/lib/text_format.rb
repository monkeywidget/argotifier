# wraps text, default 80 columns
def wrap_text(txt, col = 80, prefix_string="")
  txt.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/,
           "#{prefix_string}\\1\\3\n")
end
# from Allan Odgaard
# http://blog.macromates.com/2006/wrapping-text-with-regular-expressions/

