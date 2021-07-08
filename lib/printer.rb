# frozen_string_literal: true

# Resposible for outputting statement in required format

class Printer
  def print(transactions)
    puts header
    puts body(transactions)
  end

  private

  def header
    'date || credit || debit || balance'
  end

  def body(transactions)
    balance = 0
    lines = []
    transactions.each do |transaction|
      balance += transaction[1]
      formatted_balance = format('%.2f', balance)
      formatted_amount = format('%.2f', transaction[1].abs)
      lines << if (transaction[1]).positive?
                 "#{transaction[0]} || #{formatted_amount} || || #{formatted_balance}"
               else
                 "#{transaction[0]} || || #{formatted_amount} || #{formatted_balance}"
               end
    end
    lines.reverse
  end
end
