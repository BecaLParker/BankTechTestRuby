# frozen_string_literal: true

# Resposible for outputting statement in required format

class Printer
  def print(_transactions)
    puts header
  end

  private

  def header
    'date || credit || debit || balance'
  end
end
