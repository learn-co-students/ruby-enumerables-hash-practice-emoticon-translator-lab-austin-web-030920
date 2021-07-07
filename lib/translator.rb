require 'yaml'
require 'pp'
require 'pry'

def load_library(path)
  #path #=> "./lib/emoticons.yml"
  emoticons = YAML.load_file(path)
  # emoticons #=> HoA #=> {"angel"=>["O:)", "☜(⌒▽⌒)☞"],[]...etc}
  new = {'get_meaning' => {}, 'get_emoticon' => {}}

  emoticons.each do |key,value|
    # key #=> "angel"
    # value #=> ["O:)", "☜(⌒▽⌒)☞"]
    new['get_emoticon'][value[0]] = emoticons[key][1]
    # new['get_emoticon'[value[0]] = "☜(⌒▽⌒)☞"
    new['get_meaning'][value[1]] = key
  end
  new
end

def get_japanese_emoticon(file_path, emoticon)
  result = load_library(file_path)['get_emoticon'][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  result = load_library(file_path)['get_meaning'][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end
