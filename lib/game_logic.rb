# frozen_string_literal: true

# This module handles Hangman game logic.
module GameLogic
  def play
    guess = gets.chomp.to_s.downcase
    return invalid_guess unless valid?(guess)

    return already_guessed if guessed?(guess)

    check_guess(guess)
  end

  def valid?(guess)
    return false unless guess.chars.all?(/[a-z]/)

    return false unless guess.length == word.length || guess.length == 1

    true
  end

  def invalid_guess
    puts error_message(:invalid_guess)
    puts ask_question(:guess)
    play
  end

  def already_guessed
    puts error_message(:repeat_guess)
    puts ask_question(:guess)
    play
  end

  def check_guess(guess)
    return miss(guess) unless word.include?(guess)

    return win if win?(guess)

    @hits.push(guess)
    hits_state
  end

  def miss(guess)
    @misses.push(guess)
    puts information(:miss)
    misses_state
    return lose if misses.length == 6
  end

  def continue?
    puts ask_question(:save)
    choice = gets.chomp.to_s

    return true unless choice.downcase == 'y'

    save
    false
  end

  def guessed?(guess)
    return true if hits.include?(guess) || misses.include?(guess)

    false
  end

  def win?(guess)
    winning_guess?(guess) || last_letter?
  end

  def winning_guess?(guess)
    word == guess
  end

  def last_letter?
    word == create_hint
  end

  def win
    @in_progress = false
    puts information(:win)
  end

  def lose
    @in_progress = false
    puts information(:lose)
  end

  def create_hint
    word.gsub(regex_hits, '_').chars.join(' ')
  end

  def regex_hits
    return Regexp.new("[^#{hits.join}]") unless hits.empty?

    /[[:alpha:]]/
  end
end
