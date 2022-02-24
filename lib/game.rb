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

  attr_reader :word, :hits, :misses, :turn, :in_progress

  def initialize(args)
    args = defaults.merge(args)
    @word = args[:word]
    @misses = args[:misses]
    @turn = args[:turn]
    @hits = args[:hits]
    @in_progress = args[:in_progress]
  end

  def start
    puts instructions if in_progress
    while in_progress
      turn_beginning
      play
      @turn += 1
      break unless in_progress && continue?
    end
    puts error_message(:game_has_ended)
    GameController.new.boot_up if play_another?
  end

  def defaults
    {
      word: 'testing',
      misses: [],
      turn: 1,
      hits: [],
      in_progress: true
    }
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
      hits: hits,
      in_progress: in_progress
    }
  end

  def play_another?
    puts ask_question(:another_game)
    choice = gets.chomp.to_s
    return true if choice.downcase == 'y'

    false
  end
end
