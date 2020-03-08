# require modules here
require 'yaml'
require 'pp'

def load_library(path)
  emoticons = {
    :get_emoticon => {},
    :get_meaning => {}
  }
  library = YAML.load_file(path)

  library.each do |key,value|
    english = value[0]
    japanese = value[1]
    emoticons[:get_emoticon][english] = japanese
    emoticons[:get_meaning][japanese] = key 
  end

  emoticons
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  result = library[:get_emoticon][emoticon]
  result ? result : 'Sorry, that emoticon was not found'
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  result = library[:get_meaning][emoticon]
  result ? result : 'Sorry, that emoticon was not found'
end