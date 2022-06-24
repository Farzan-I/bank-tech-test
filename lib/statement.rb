# frozen_string_literal: false

class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def details
    account_statement = 'date   || credit || debit || balance'
  end
end
