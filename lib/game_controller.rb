# frozen_string_literal: true

require_relative './message_text'
require_relative './dictionary'
require_relative './saveable'
require_relative './game_logic'

# This class handles setting up a game of Hangman.
class GameController
  include MessageText

  attr_reader :game, :dictionary

  def initialize(args)
    @dictionary = args[:dictionary] || default_dictionary
    @game = args[:game] || default_game
  end

  def default_game
    Game.new({ word: default_dictionary.default })
  end

  def default_dictionary
    Dictionary.new
  end

  def start
    game.start
  end
end
