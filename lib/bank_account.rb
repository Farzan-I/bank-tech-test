# frozen_string_literal: false

require_relative('./statement')
require_relative('./transaction')

class Bank_account
  attr_reader :balance, :statement

  def initialize(statement_class = Statement, transaction_class = Transaction)
    @balance = 0
    @statement = statement_class.new
    @transaction_class = transaction_class
  end

  def deposit(amount)
    @balance += amount
    @statement.add(@transaction_class.new(debit: nil, credit: amount, new_balance: @balance))
  end

  def withdraw(amount)
    # raise "Exceeded available balance of £#{@balance}, please withdraw a smaller amount." if amount > @balance
    @balance -= amount
    @statement.add(@transaction_class.new(debit: amount, credit: nil, new_balance: @balance))
  end
end
