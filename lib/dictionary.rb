# frozen_string_literal: true

require_relative './message_text'
require_relative './saveable'

# This class handles creating Hangman dictionaries.
class Dictionary
  include MessageText
  include Saveable
  attr_reader :dictionary, :path

  def initialize(path = 'dictionaries/default.txt')
    @path = path
  end

  def load
    @dictionary = File.readlines(path)
  end

  def save
    Dir.mkdir('dictionaries') unless Dir.exist?('dictionaries')

    name = create_filename
    File.open("dictionaries/#{name}.txt", 'w') do |file|
      file.puts dictionary
    end
  end

  def prepare
    range = create_range
    @dictionary = dictionary.select { |word| range.include?(word.chomp.length) }
  end

  def pick_word
    dictionary.sample.chomp
  end

  def create_range
    puts ask_question(:min_length)
    min_length = gets.chomp.to_i
    puts ask_question(:max_length)
    max_length = gets.chomp.to_i
    (min_length..max_length)
  end

  def default
    load
    pick_word
  end
end
