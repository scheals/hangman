# frozen_string_literal: true

# This module handles displaying the game.
module Display

  def turn_beginning
    guess_state
    misses_state
    puts ask_question(:guess)
  end

  def misses_state
    puts misses.join(',')
    puts "You have #{6 - misses.length} lives left."
  end

  def guess_state
    puts "This is the current state of the game: \n\n#{state}"
  end

end
