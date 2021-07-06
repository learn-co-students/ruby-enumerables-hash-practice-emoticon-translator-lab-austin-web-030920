# require modules here
require "yaml"

def load_library(path)
  # code goes here
  structured_hash = {:get_meaning => {}, :get_emoticon => {}}
  
  raw_data = YAML.load_file(path)
  raw_data.each do |meaning, (english, japanese)|
    structured_hash[:get_meaning][japanese] = meaning
    structured_hash[:get_emoticon][english] = japanese
  end
    
  structured_hash
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  data = load_library(path)
  result = data[:get_emoticon][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  # code goes here
  data = load_library(path)
  result = data[:get_meaning][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end