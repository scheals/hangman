# frozen_string_literal: true

# This class handles creating Hangman dictionaries.
class Dictionary
  attr_reader :dictionary, :path

  def initialize(path)
    @path = path
  end

  def load
    @dictionary = File.readlines(path)
  end

  def save(name)
    Dir.mkdir('dictionaries') unless Dir.exist?('dictionaries')

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
    # ask_question(rangestart)
    minlength = gets.chomp.to_i
    # ask_question(rangeend)
    maxlength = gets.chomp.to_i
    (minlength..maxlength)
  end
end
