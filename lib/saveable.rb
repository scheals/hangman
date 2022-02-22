# frozen_string_literal: true

# This module handles saving the game.
module Saveable
  def save(saveable)
    Dir.mkdir('savegames') unless Dir.exist?('savegames')

    name = create_filename
    File.open("savegames/#{name}.txt", 'w') do |file|
      file.puts YAML.dump(saveable)
    end
  end

  def create_filename
    puts ask_question(:file_name)
    gets.chomp.to_s
  end
end
