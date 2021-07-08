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
      lines << if (transaction[1]).positive?
                 "#{transaction[0]} || #{'%.2f' % transaction[1]} || || #{'%.2f' % balance}"
               else
                 "#{transaction[0]} || || #{'%.2f' % transaction[1].abs} || #{'%.2f' % balance}"
               end
    end
    lines.reverse
  end
end
