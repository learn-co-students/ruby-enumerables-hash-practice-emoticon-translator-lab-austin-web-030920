require "yaml"

def load_library(path_name)
  data = YAML.load_file(path_name)
  emoticons = {}
  emoticons[:get_meaning] = {}
  emoticons[:get_emoticon] = {}

  data.each do |key, value|
    english_emoticons = value[0]
    japanese_emoticons = value[1]
    emoticons[:get_meaning][japanese_emoticons] = key  
    emoticons[:get_emoticon][english_emoticons] = japanese_emoticons
  end
  pp emoticons
end

def get_japanese_emoticon(path_name, emoticon)
  data = load_library(path_name)
  answer = "Sorry, that emoticon was not found"

  data[:get_emoticon].each do |key, value|
    answer = value if key == emoticon
      
  end
  p answer
end

def get_english_meaning(path_name, emoticon)
  data = load_library(path_name)
  answer = "Sorry, that emoticon was not found"

  data[:get_meaning].each do |key, value|
    answer = value if key == emoticon
  
  end
  p answer
end