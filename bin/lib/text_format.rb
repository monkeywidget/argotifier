# wraps text, default 80 columns
def wrap_text(txt, col = 80)
  txt.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/,
           "\\1\\3\n")
end
# from Allan Odgaard
# http://blog.macromates.com/2006/wrapping-text-with-regular-expressions/

