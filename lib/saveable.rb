# frozen_string_literal: true

# This module handles saving the game.
module Saveable
  def create_filename
    puts ask_question(:file_name)
    gets.chomp.to_s
  end
end
