# frozen_string_literal: true

# This module handles Hangman game logic.
module GameLogic

  def play
    guess = gets.chomp.to_s.downcase
    return replay unless valid?(guess)

    check_guess(guess)
  end

  def valid?(guess)
    return false unless guess.chars.all?(/[a-z]/)

    return false unless guess.length == word.length || guess.length == 1

    true
  end

  def replay
    puts error_message(:invalid_guess)
    puts ask_question(:guess)
    play
  end

  def check_guess(guess)
    return missed(guess) unless word.include?(guess)

    return win if word == guess

    @state = word.tr(guess, '*').gsub(/[a-z]/, '_').tr('*', guess).chars.join(" ")
    turn_beginning
    play
  end

  def missed(guess)
    @misses.push(guess)
    puts information(:miss)
    return lose if misses.length == 6

    turn_beginning
    play
  end

  def win
    puts information(:win)
  end

  def lose
    puts information(:lose)
  end
end
