# frozen_string_literal: true

require_relative './message_text'
require_relative './dictionary'
require_relative './saveable'
require_relative './game_logic'

# This class handles setting up a game of Hangman.
class GameController
  include MessageText

  def play
    # puts instructions
  end
end
