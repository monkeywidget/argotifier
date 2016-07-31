def usage_document
    "\n\tdocument load \"New Title\" <plaintext_filename.txt>\n\tdocument save \"Existing Title\" <translation_filename.txt>\n\n"
end

def usage_paragraph
  "\n\tparagraph <paragraph to show>\n\tparagraph <first paragraph to show> <last paragraph to show>\n\n"
end

def usage_translation
  "\n\ttranslation <word to translate> <new translation>\n\ttranslation <translation to search for>\n\n"
end

def usage_dictionary
  "\n\tdictionary stats\n\tdictionary save <translation_filename.csv>\n\tdictionary load <translation_filename.csv>\n\n"
end

def usage_word
  "\n\tword <matching substring>\n\tword -c <matching substring to count>\n\tword -u <untranslated matching substring>\n\n"
end

def usage_sentence
  "\n\tsentence <word to show sentences containing>\n\n"
end
