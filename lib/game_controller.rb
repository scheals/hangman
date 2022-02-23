# frozen_string_literal: true

require 'psych'
require_relative './message_text'
require_relative './dictionary'
require_relative './saveable'
require_relative './game_logic'

# This class handles setting up a game of Hangman.
class GameController
  include MessageText
  include Saveable
  attr_reader :game, :dictionary

  def boot_up
    return default_game.start if load?

    load
  end

  def default_game
    @game = Game.new({ word: default_dictionary.default })
  end

  def default_dictionary
    @dictionary = Dictionary.new
  end

  def start_game
    game.start
  end

  def load
    name = create_filename
    variables = Psych.safe_load_file("savegames/#{name}.yaml", permitted_classes: [Symbol])
    @game = Game.new(variables)
    start_game
  end

  def load?
    puts ask_question(:load)
    choice = gets.chomp.to_s

    return true unless choice.downcase == 'y'

    false
  end
end
