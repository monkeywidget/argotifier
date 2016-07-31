require_relative '../../argotifier/persist/dictionary_loader'
# require_relative '../../argotifier/persist/dictionary_saver'

module Argotifier
  class Dictionary < Thor
    desc "load <filename_csv>", "Load the translations list <filename_csv>"

    def load(filename_csv)
      fail("File #{filename_csv} is not a .csv file!") unless filename_csv.match(/\.csv$/)
      Argotifier::DictionaryLoader.new(filename_csv)
    end

    desc "save <filename_csv>", "Save the translations list to a file <filename_csv>"

    def save(filename_csv)
      fail("Filename #{filename_csv} should end in .csv") unless filename_csv.match(/\.csv$/)
      # DictionarySaver.new(filename_csv)
    end

    desc "stats", "Print the stats about the translations"

    def stats
      puts 'DEBUG in stats'
    end
  end
end
