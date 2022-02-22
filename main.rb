# frozen_string_literal: true

require_relative 'lib/message_text'
require_relative 'lib/dictionary'
require_relative 'lib/game'
require_relative 'lib/saveable'
require_relative 'lib/game_logic'
require_relative 'lib/game_controller'

GameController.new({}).start
