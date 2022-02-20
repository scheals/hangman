# frozen_string_literal: true

# This module contains all the text messages for the game.
module MessageText
  def ask_question(question)
    {
      min_length: 'How many letters does the word have minimum?',
      max_length: 'How many letters does the word have maximum?',
      guess: 'What letter would you like to guess?'
    }[question]
  end
end
