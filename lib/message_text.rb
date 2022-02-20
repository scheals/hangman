# frozen_string_literal: true

module MessageText

  def ask_question(question)
    { min_length: 'How many letters does the word have minimum?',
      max_length: 'How many letters does the word have maximum?'
    }[question]
  end

end

