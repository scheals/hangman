# frozen_string_literal: true

# This module contains all the text messages for the game.
module MessageText
  def ask_question(question)
    {
      min_length: 'How many letters does the word have minimum?',
      max_length: 'How many letters does the word have maximum?',
      guess: 'What would you like to guess?'
    }[question]
  end

  def error_message(error)
    {
      invalid_guess: 'Your guess was invalid. You can only guess a single letter or the whole word.'
    }[error]
  end

  def information(message)
    {
      miss: "#{misses.last} is not a correct guess.",
      lose: "You have lost! Sorry about that. #{word.upcase} was the word.",
      win: "You have won! It took you #{turn + 1} guesses to get there."
    }[message]
  end

  def instructions
    <<~HEREDOC

      Welcome to Hangman!

      Your job is to guess a word. You know how long it is and every turn you can
      ask whether a particular letter is in that word. If that letter is in the word,
      you uncover every instance of it at once. If it is not, you lose a life.

      Losing six lives means you have failed to guess the word and thus have lost the game.
      You can at any point attempt to guess the word but if you fail to do so correctly,
      you lose a life.

      Good luck!

    HEREDOC
  end
end
