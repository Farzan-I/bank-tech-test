# frozen_string_literal: false

class Transaction
  attr_reader :carried_out, :credit, :debit, :new_balance

  def initialize(carried_out = Time.now, credit:, debit:, new_balance:)
    @carried_out = carried_out
    @credit = credit
    @debit = debit
    @new_balance = new_balance
  end
end
