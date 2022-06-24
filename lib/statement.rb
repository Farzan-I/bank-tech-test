# frozen_string_literal: false

require 'time'

class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def details
    statement = ['date   || credit || debit || balance']
    @transactions.each do |transaction|
      statement << ([
        transaction.carried_out.strftime('%d/%m/%Y'),
        transaction.credit ? format('%.2f', transaction.credit) : nil,
        transaction.debit ? format('%.2f', transaction.debit) : nil,
        format('%.2f', transaction.new_balance)
      ].join(' || '))
    end
    statement.join("\n")
  end

  def add(transaction)
    @transactions.unshift(transaction)
  end
end
