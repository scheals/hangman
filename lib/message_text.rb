# frozen_string_literal: true

# This module contains all the text messages for the game.
module MessageText
  def ask_question(question)
    {
      min_length: 'How many letters does the word have minimum?',
      max_length: 'How many letters does the word have maximum?',
      guess: "\nWhat would you like to guess?",
      file_name: 'How is the file called?',
      save: "\nWould you like to save your progress and stop playing?\nType 'y' to save.",
      load: "Would you like to load a saved game?\n Type 'y' to load.",
      another_game: "\nWould you like to play another game?\n Type 'y' to play."
    }[question]
  end

  def error_message(error)
    {
      invalid_guess: 'Your guess was invalid. You can only guess a single letter or the whole word.',
      game_has_ended: 'Well, it looks like this game has ended! Thank you for playing.',
      repeat_guess: 'You have already tried this!'
    }[error]
  end

  def information(message)
    {
      miss: "#{misses.last} is not a correct guess.",
      lose: "You have lost! Sorry about that. #{word.upcase} was the word.",
      win: "You have won! It took you #{turn} guesses to get there.",
      thank: 'Thank you for playing!'
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
