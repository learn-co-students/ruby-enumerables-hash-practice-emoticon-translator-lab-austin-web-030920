require "yaml"
require "pry"

def load_library(file)
  emotes = YAML.load_file(file)
  emotes_formatted = {get_meaning: {}, get_emoticon: {}}
  emotes.each do |(key, value)|
    emotes_formatted[:get_meaning][value[1]] = key
  # puts emotes_formatted
    emotes_formatted[:get_emoticon][value[0]] = value[1]
  end
  # binding.pry
  emotes_formatted
end

def get_japanese_emoticon(file, emoticon)
  emotes_formatted = load_library(file)
  emote_found = emotes_formatted[:get_emoticon].find do |(key, value)|
    if key == emoticon
      return value
    end
  end
  if !emote_found
    return "Sorry, that emoticon was not found"
  end
  # binding.pry
end

def get_english_meaning(file, emoticon)
  emotes_formatted = load_library(file)
  emote_found = emotes_formatted[:get_meaning].find do |(key, value)|
    if key == emoticon
      return value
    end
  end
  if !emote_found
    return "Sorry, that emoticon was not found"
  end
end
