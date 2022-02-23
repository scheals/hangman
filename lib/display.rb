# frozen_string_literal: true

# This module handles displaying the game.
module Display
  def turn_beginning
    hits_state
    misses_state
    puts ask_question(:guess)
  end

  def misses_state
    puts "Already tried: #{misses.join(',')}"
    puts "You have #{6 - misses.length} lives left."
  end

  def hits_state
    puts "This is the current state of the game: \n\n#{create_hint}"
  end
end
