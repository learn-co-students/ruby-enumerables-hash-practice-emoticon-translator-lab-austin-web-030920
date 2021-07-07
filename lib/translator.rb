require 'yaml'
require 'pp'
def load_library(path)
  emoticons = YAML.load_file(path)
#calls on the yaml path properly
  emoticons_meaning = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning, emoticon|
    emoticons_meaning["get_emoticon"][emoticon.first] = emoticon.last
    emoticons_meaning["get_meaning"][emoticon.last] = meaning
  end
  pp emoticons_meaning
  #pretty print so it returns the actual symbols instead of gibberish
end


def get_japanese_emoticon(path, emoticon)
  emoticons_meaning = load_library(path)
  translator = emoticons_meaning["get_emoticon"][emoticon]
  if translator == nil
    return "Sorry, that emoticon was not found"
  end
  translator
end


def get_english_meaning(path, emoticon)
  #same thing as get_japanese_emoticon except with "get_meaning" instead of "get_emoticon"--instead of giving A and getting B, we're giving B and expecting A (if they exist)
  emoticons_meaning = load_library(path)
  translator = emoticons_meaning["get_meaning"][emoticon]
  if translator == nil
    return "Sorry, that emoticon was not found"
  end
  translator
end







