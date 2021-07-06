# frozen_string_literal: true

# Provides the date for account transactions
require 'date'

class Calendar
  def date
    Time.now.strftime("%d/%m/%Y")
  end
end
