# frozen_string_literal: true

require 'psych'
require_relative './saveable'
require_relative './game_logic'
require_relative './message_text'
require_relative './display'
# This class handles playing a game of Hangman.
class Game
  include Saveable
  include MessageText
  include Display
  include GameLogic

  attr_reader :word, :hits, :misses, :turn

  def initialize(args)
    @word = args[:word] || default_word
    @misses = args[:misses] || default_misses
    @turn = args[:turn] || default_turn
    @hits = args[:hits] || default_hits
  end

  def start
    puts instructions
    turn_beginning
    play
  end

  def default_word
    'testing'
  end

  def default_misses
    []
  end

  def default_turn
    1
  end

  def default_hits
    []
  end

  def save
    Dir.mkdir('savegames') unless Dir.exist?('savegames')

    name = create_filename
    File.open("savegames/#{name}.yaml", 'w') do |file|
      file.puts Psych.dump(variables)
    end
  end

  def variables
    {
      word: word,
      misses: misses,
      turn: turn,
      hits: hits
    }
  end
end
