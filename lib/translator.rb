require "yaml"

def load_library(file_path)
 
  emoticons = YAML.load_file(file_path)
  emotes = {}
  emotes["get_emoticon"] = {}
  emotes["get_meaning"] = {}
  
 
 
  emoticons.each do |english, emoticon_collection|
    emotes["get_emoticon"][emoticon_collection[0]] = emoticon_collection[-1]
    emotes["get_meaning"][emoticon_collection[-1]] = english
    
  end
  return emotes
end

def get_japanese_emoticon(file_path, emote)
  emoticons = load_library(file_path)
  emote = emoticons["get_emoticon"][emote]
  if emote == nil
    return "Sorry, that emoticon was not found"
  end
  return emote
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  meaning = emoticons["get_meaning"][emoticon]
  if meaning == nil
    return "Sorry, that emoticon was not found"
  end
  return meaning
end