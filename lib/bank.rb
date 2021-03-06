# frozen_string_literal: true

require_relative 'printer'

# Responsible for user-account interaction logic
class Bank
  attr_reader :transactions

  def initialize(printer = Printer.new)
    @printer = printer
    @transactions = []
  end

  def print_statement
    @printer.print(@transactions)
  end

  def deposit(date, amount)
    raise 'Transaction must be greater than 0' if amount <= 0

    @transactions << [date, amount]
  end

  def withdraw(date, amount)
    raise 'Transaction must be greater than 0' if amount <= 0

    @transactions << [date, -amount]
  end
end
