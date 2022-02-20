# frozen_string_literal: true

require_relative './message_text'
require_relative './dictionary'
require_relative './saveable'
require_relative './game_logic'

# This class handles playing a game of Hangman.
class Game
  include MessageText
  include Saveable

end
